<?php

namespace metaunicorn\Pokedata\Behaviors;

trait ConfigAware
{
    /**
     * @var array
     */
    private $config = [];

    /**
     * @param string|null $name If not specified, returns the full config
     * Predefined config: table_prefix, csv_import_rules
     *
     * @param mixed|null $default
     *
     * @return mixed|null
     */
    public function getConfig($name = null, $default = null)
    {
        if ( ! $name) {
            return $this->config;
        }

        return isset($this->config[$name]) ? $this->config[$name] : $default;
    }

    /**
     * @param string|array $name If array is given, the full config is replaced
     * @param string $value
     *
     * @return static
     */
    public function setConfig($name, $value = null)
    {
        if (is_array($name)) {
            $this->config = $name;
        } else {
            $this->config[$name] = $value;
        }

        return $this;
    }
}