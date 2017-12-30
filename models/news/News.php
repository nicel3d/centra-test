<?php

namespace news;

use app\models\NewsToTag;
use users\User;
use Yii;
use yii\behaviors\TimestampBehavior;

/**
 * This is the model class for table "{{%news}}".
 *
 * @property int $id
 * @property string $title
 * @property string $image
 * @property string $alias
 * @property string $article
 * @property int $created_at
 * @property int $updated_at
 * @property int $user_id
 * @property string $_tags
 *
 * @property \users\User $user
 * @property \app\models\NewsToTag[] $newsToTags
 */
class News extends \yii\db\ActiveRecord
{
    public $_tags;
    public $_file;
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%news}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            ['_tags', 'each', 'rule' => ['integer']],

            [['article'], 'string'],
            [['created_at', 'updated_at'], 'required'],
            [['created_at', 'updated_at', 'user_id'], 'integer'],

            [['title', 'image', 'alias'], 'string', 'max' => 40],

            [['_file'], 'file', 'extensions' => 'png, jpg'],

            ['alias', 'match', 'pattern' => '/^[a-z0-9-_]+$/'],

            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'title' => Yii::t('app', 'Title'),
            'image' => Yii::t('app', 'Image'),
            'alias' => Yii::t('app', 'Alias'),
            'article' => Yii::t('app', 'Article'),
            'created_at' => Yii::t('app', 'Created At'),
            'updated_at' => Yii::t('app', 'Updated At'),
            'user_id' => Yii::t('app', 'User ID'),
        ];
    }

    public function behaviors()
    {
        return [
            TimestampBehavior::className(),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getNewsToTags()
    {
        return $this->hasMany(NewsToTag::className(), ['news_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return \news\query\NewsQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \news\query\NewsQuery(get_called_class());
    }
}
