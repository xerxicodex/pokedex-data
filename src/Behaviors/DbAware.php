<?php

namespace metaunicorn\Pokedata\Behaviors;

use metaunicorn\Pokedata\Orm\Db;

trait DbAware
{
    /**
     * @var Db
     */
    private $db;

    /**
     * @return Db
     */
    public function getDb()
    {
        return $this->db;
    }

    /**
     * @param Db $db
     *
     * @return static
     */
    public function setDb(Db $db)
    {
        $this->db = $db;

        return $this;
    }
}