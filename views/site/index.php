<?php

/* @var $this yii\web\View */

use yii\bootstrap\Html;
use yii\widgets\LinkPager;
use yii\widgets\Pjax;

$this->title = 'Лента новостей';

?>
<?php Pjax::begin(['id' => 'products-list']);?>
    <div class="row">
        <div class="col-sm-3 col-sm-push-9">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <span class="panel-title">Теги: </span>
                </div>
                <div class="panel-body">
                    <?php foreach ($list_tag as $tag): ?>
                        <?php if ($param == $tag->id):?>
                            <span><b><?=$tag->title?></b></span>
                        <?php else:?>
                            <span><a href="/?tag=<?=$tag->id?>"><?=$tag->title?></a>&nbsp;</span>
                        <?php endif;?>
                    <?php endforeach;?>
                </div>
            </div>
        </div>
        <div class="col-sm-9 col-sm-pull-3">
            <div class="panel-body">
                <h1><?=$this->title?></h1>
            </div>
                <?php if(!count($list_news)) echo "<div class='row'>Нету результатов</div>"; else
                    foreach ($list_news as $news){ ?>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <span class="panel-title"><?=$news->title?></span>
                                <div class="panel-heading-controls">
                                    <div class="panel-heading-text">
                                        <?=Html::encode(\users\User::findIdentity($news->user_id)->username)?>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="1100t-primary col-md-3">
                                        <span><?=date('d:m:y H:i:s', $news->updated_at)?></span>
                                    </div>
                                    <div class="col-md-9">
                                        <?php foreach ($news['newsToTags'] as $s_tag):?>
                                            <?php if ($param == $s_tag->tag_id):?>
                                                <span><b><?=$list_tag_array[$s_tag->tag_id]?></b></span>
                                            <?php else:?>
                                                <span><a href="/?tag=<?=$s_tag->tag_id?>"><?=$list_tag_array[$s_tag->tag_id]?></a>&nbsp;</span>
                                            <?php endif;?>
                                        <?php endforeach;?>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <img src="/img/article/<?=$news->image?>" class="image-article" alt=""/>
                                    </div>
                                    <div class="col-md-8">
                                        <p><?=\yii\helpers\StringHelper::truncate($news->article, 500, '...')?></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php } ?>
            <?= LinkPager::widget(['pagination'=>$pagination])?>
        </div>
    </div>

<?php Pjax::end();?>