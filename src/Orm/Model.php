<?php

namespace metaunicorn\Pokedata\Orm;

use metaunicorn\Pokedata\Common\Inflector;

class Model implements \ArrayAccess, \JsonSerializable, \Serializable
{
    /**
     * @var array
     */
    protected $attributes;

    /**
     * @var array
     */
    protected $subqueries = [];

    /**
     * @var Db
     */
    protected static $db;

    /**
     * @var string
     */
    protected static $tablePrefix;

    /**
     * @var string
     */
    protected static $tableName;

    /**
     * @var array
     */
    protected static $selectAttributes = ['*'];

    public function __construct(array $attributes = [])
    {
        $this->attributes = $attributes;
    }

    public static function getTableName()
    {
        if(!static::$tableName){
            static::$tableName = Inflector::tableize(static::class);
        }
        return static::getDb()->getTablePrefix() . static::$tableName;
    }

    /**
     * @return Db
     */
    protected static function getSelectStatement($where)
    {
        return static::getDb()
                     ->select(implode(',', static::$selectAttributes), static::getTableName())
                     ->setFetchClass(static::class);
    }

    /**
     * @param string $column
     * @param mixed $value
     * @param string $columnOperator
     * @param string $statementOperator
     *
     * @return Dbal
     */
    public static function findWhere($column, $value, $columnOperator = '=', $statementOperator = 'AND')
    {
        return static::prepareFind()->where($column, $value, $columnOperator, $statementOperator);
    }

    /**
     * @param string $where
     *
     * @return Dbal
     */
    public static function findWhereRaw($where)
    {
        return static::prepareFind()->raw('WHERE ' . $where, false);
    }

    /**
     * @return Dbal
     */
    public static function findAll()
    {
        return static::prepareFind();
    }

    /**
     * Find by ID, in the 'id' column and returns the first result
     *
     * @param $id
     *
     * @return static
     */
    public static function find($id)
    {
        return static::prepareFind()->where('id', $id)->limit(1)->first();
    }

    /**
     * @return Db
     */
    public static function getDb()
    {
        if ( ! static::$db) {
            static::$db = Db::getInstance();
        }

        return static::$db;
    }

    /**
     * @param Db $db
     */
    public static function setDb(Db $db)
    {
        static::$db = $db;
    }

    public function __get($name)
    {
        return $this->__isset($name) ? $this->attributes[$name] :
            ($this->hasSubQuery($name) ? $this->getSubQuery($name) : null);
    }

    public function __set($name, $value)
    {
        $this->attributes[$name] = $value;
    }

    public function __isset($name)
    {
        return isset($this->attributes[$name]);
    }

    public function __unset($name)
    {
        if ($this->__isset($name)) {
            unset($this->attributes[$name]);
        }

    }

    public function offsetExists($offset)
    {
        $this->__isset($offset);
    }

    public function offsetGet($offset)
    {
        $this->__get($offset);
    }

    public function offsetSet($offset, $value)
    {
        $this->__set($offset, $value);
    }

    public function offsetUnset($offset)
    {
        $this->__unset($offset);
    }

    /**
     * @return array
     */
    public function getAttributes()
    {
        return $this->attributes;
    }

    /**
     * @param array $attributes
     *
     * @return $this
     */
    public function setAttributes(array $attributes)
    {
        $this->attributes = $attributes;

        return $this;
    }

    public function toJson($options = 0)
    {
        return json_encode($this->attributes, $options);
    }

    public function __toString()
    {
        return $this->toJson(JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_NUMERIC_CHECK);
    }

    public function jsonSerialize()
    {
        return $this->attributes;
    }

    public function serialize()
    {
        return serialize($this->attributes);
    }

    public function unserialize($serialized)
    {
        $this->attributes = $this->unserialize($serialized);
    }

    public function hasSubQuery($name)
    {
        return isset($this->attributes['__queries'][$name]);
    }

    public function getSubQuery($name)
    {
        return $this->hasSubQuery($name) ? $this->attributes['__queries'][$name] : [];
    }

    public function setSubQuery($name, $value)
    {
        $this->attributes['__queries'][$name] = $value;

        return $this;
    }

}