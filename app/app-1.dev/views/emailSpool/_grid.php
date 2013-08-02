<?php
/**
 * @var $this EmailSpoolController
 * @var $emailSpool EmailSpool
 */

$columns = array();
$columns[] = array(
    'name' => 'id',
    'class' => 'TbDropdownColumn',
);
$columns[] = 'model';
$columns[] = 'model_id';
$columns[] = array(
    'name' => 'message_subject',
    'type' => 'raw',
    'value' => '"<b>".h($data->subject)."</b>"',
);
$columns[] = 'to_name';
$columns[] = 'to_email';
$columns[] = array(
    'name' => 'status',
    'type' => 'raw',
    'value' => '$data->status',
);
$columns[] = array(
    'name' => 'sent',
    'type' => 'raw',
    'value' => '$data->sent_date?$data->sent_date:""',
);
$columns[] = array(
    'name' => 'created',
    'type' => 'raw',
    'value' => 'Time::agoIcon($data->created)',
);

// grid
$this->widget('GridView', array(
    'id' => 'emailSpool-grid',
    'dataProvider' => $emailSpool->search(),
    'filter' => $emailSpool,
    'columns' => $columns,
));
