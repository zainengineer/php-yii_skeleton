<?php

/**
 * Class GeneratePropertiesAction
 */
class GeneratePropertiesAction extends CAction
{

    /**
     * @var
     */
    public $modelName;

    /**
     * @var CActiveRecord
     */
    public $model;

    /**
     * Runs the action.
     * This method displays the view requested by the user.
     * @throws CHttpException if the modelName is invalid
     */
    public function run()
    {
        // try get the model name
        $this->modelName = sf('modelName');

        // show a list
        if (!$this->modelName) {
            $this->renderModelList();
            return;
        }

        // load the model
        $this->model = CActiveRecord::model($this->modelName);
        if (!$this->model) {
            throw new CHttpException(strtr(t('No CActiveRecord Class with name :modelName was not found.'), array(':modelName' => $this->modelName)));
        }

        // render the properties
        $this->renderModelProperties();
    }

    /**
     *
     */
    public function renderModelList()
    {
        ob_start();
        $this->controller->widget('bootstrap.widgets.TbMenu', array(
            'type' => 'pills', // '', 'tabs', 'pills' (or 'list')
            'stacked' => true, // whether this is a stacked menu
            'items' => $this->getModelList(),
        ));
        $contents = ob_get_clean();
        $this->controller->renderText($contents);
    }

    /**
     * @return array
     */
    public function getModelList()
    {
        $pathList = CFileHelper::findFiles(Yii::getPathOfAlias("application.models"), array('fileTypes' => array('php')));
        $modelList = array();
        foreach ($pathList as $path) {
            $modelName = basename($path, '.php');
            @$model = new $modelName;
            if ($model && is_subclass_of($model, 'CActiveRecord')) {
                $modelList[] = array('label' => $modelName, 'url' => array('/tool/generateProperties', 'modelName' => $modelName));
            }
        }
        return $modelList;
    }

    /**
     *
     */
    public function renderModelProperties()
    {
        $begin = " * --- BEGIN GenerateProperties ---";
        $end = " * --- END GenerateProperties ---";
        $contents = $begin . "\n" . implode("\n", $this->getModelProperties()) . "\n" . $end;

        $message = '';
        $fileName = Yii::getPathOfAlias("application.models") . '/' . $this->modelName . '.php';
        if (file_exists($fileName)) {
            $fileContents = file_get_contents($fileName);
            $fileContents = strtr($fileContents, array(
                ' * --- BEGIN AutoGenerated by tool/generateProperties ---' => $begin,
                ' * --- END AutoGenerated by tool/generateProperties ---' => $end,
            ));
            $firstPos = strpos($fileContents, $begin);
            $lastPos = strpos($fileContents, $end);
            if ($firstPos && $lastPos && ($lastPos > $firstPos)) {
                $oldDoc = StringHelper::getBetweenString($fileContents, $begin, $end, false, false);
                if ($contents != $oldDoc) {
                    file_put_contents($fileName, str_replace($oldDoc, $contents, $fileContents));
                    $message = 'overwrote file: ' . realpath($fileName);
                }
                else {
                    $message = 'contents matches file: ' . realpath($fileName);
                }
            }
        }
        $this->controller->renderText($message . '<pre>' . $contents . '</pre>');
    }

    /**
     * @return array
     */
    public function getModelProperties()
    {
        $properties = array();

        // intro
        $properties[] = " *";
        $properties[] = " * This is the model class for table '" . $this->model->tableName() . "'";
        $properties[] = " *";

        // table
        $properties[] = " * @method {$this->modelName} with() with()";
        $properties[] = " * @method {$this->modelName} find() find(\$condition, array \$params = array())";
        $properties[] = " * @method {$this->modelName}[] findAll() findAll(\$condition = '', array \$params = array())";
        $properties[] = " * @method {$this->modelName} findByPk() findByPk(\$pk, \$condition = '', array \$params = array())";
        $properties[] = " * @method {$this->modelName}[] findAllByPk() findAllByPk(\$pk, \$condition = '', array \$params = array())";
        $properties[] = " * @method {$this->modelName} findByAttributes() findByAttributes(array \$attributes, \$condition = '', array \$params = array())";
        $properties[] = " * @method {$this->modelName}[] findAllByAttributes() findAllByAttributes(array \$attributes, \$condition = '', array \$params = array())";
        $properties[] = " * @method {$this->modelName} findBySql() findBySql(\$sql, array \$params = array())";
        $properties[] = " * @method {$this->modelName}[] findAllBySql() findAllBySql(\$sql, array \$params = array())";
        $properties[] = " *";

        // behaviors
        $behaviors = $this->model->behaviors();
        $inheritedMethods = array();
        foreach (get_class_methods('CActiveRecordBehavior') as $methodName) {
            $inheritedMethods[$methodName] = $methodName;
        }
        $reflection = new ReflectionClass ($this->modelName);
        $selfMethods = CHtml::listData($reflection->getMethods(), 'name', 'name');
        foreach ($behaviors as $behavior) {
            $className = $behavior;
            if (is_array($behavior)) {
                $className = $behavior['class'];
            }
            $className = explode('.', $className);
            $className = $className[count($className) - 1];
            $methods = get_class_methods($className);
            $header = false;
            foreach ($methods as $methodName) {
                if (isset($inheritedMethods[$methodName]) || isset($selfMethods[$methodName])) {
                    continue;
                }
                if (!$header) {
                    $properties[] = " * Methods from behavior " . $className;
                    $header = true;
                }

                $methodReturn = StringHelper::getTypeFromDocComment($className, $methodName, 'return');
                $paramTypes = StringHelper::getDocComment($className, $methodName, 'param');
                $methodReturn = $methodReturn ? current($methodReturn) . ' ' : '';
                $property = " * @method $methodReturn$methodName() $methodName(";
                $r = new ReflectionMethod($className, $methodName);
                $params = $r->getParameters();
                $separator = '';
                foreach ($params as $param) {
                    //$param is an instance of ReflectionParameter
                    /* @var $param ReflectionParameter */
                    $type = current($paramTypes);
                    $filterType = '';
                    if ($type && strpos($type, '$')) {
                        $typeString = StringHelper::getBetweenString($type, false, '$');
                        $typeString = trim($typeString);
                        $filterType = StringHelper::filterDocType($typeString);
                        $filterType = $filterType ? trim($filterType) . ' ' : '';
                    }
                    next($paramTypes);
                    $property .= $separator . $filterType . '$' . $param->getName();
                    if ($param->isOptional()) {
                        $property .= ' = ';
                        $property .= strtr(str_replace("\n", '', var_export($param->getDefaultValue(), true)), array(
                            'array (' => 'array(',
                        ));
                    }
                    $separator = ', ';
                }
                $property .= ")";
                $properties[] = $property;

            }
            if ($header) {
                $properties[] = ' *';
            }
        }

        // relations
        $relations = $this->model->relations();
        if ($relations) {
            $properties[] = ' * Properties from relation';
            foreach ($relations as $relationName => $relation) {
                if (in_array($relation[0], array('CBelongsToRelation', 'CHasOneRelation'))) {
                    $properties[] = ' * @property ' . $relation[1] . ' $' . $relationName;
                }
                elseif (in_array($relation[0], array('CHasManyRelation', 'CManyManyRelation'))) {
                    $properties[] = ' * @property ' . $relation[1] . '[] $' . $relationName;
                }
                elseif (in_array($relation[0], array('CStatRelation'))) {
                    $properties[] = ' * @property integer $' . $relationName;
                }
                else {
                    $properties[] = ' * @property unknown $' . $relationName;
                }

            }
            $properties[] = ' *';
        }

        // table fields
        $properties[] = ' * Properties from table fields';
        foreach ($this->model->tableSchema->columns as $column) {
            $type = $column->type;
            if (($column->dbType == 'datetime') || ($column->dbType == 'date')) {
                $type = $column->dbType;
            }
            if (strpos($column->dbType, 'decimal') !== false) {
                $type = 'number';
            }
            $properties[] = ' * @property ' . $type . ' $' . $column->name;
        }

        $properties[] = ' *';

        // all done...
        return $properties;
    }

}