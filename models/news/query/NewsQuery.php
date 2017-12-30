<?php

namespace news\query;

/**
 * This is the ActiveQuery class for [[\news\News]].
 *
 * @see \news\News
 */
class NewsQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return \news\News[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return \news\News|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
