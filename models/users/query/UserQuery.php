<?php

namespace users\query;

/**
 * This is the ActiveQuery class for [[\users\User]].
 *
 * @see \users\User
 */
class UserQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return \users\User[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return \users\User|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
