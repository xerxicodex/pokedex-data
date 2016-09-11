<?php

namespace metaunicorn\Pokedata\Behaviors;

use metaunicorn\Pokedata\App;

trait AppAware
{
    /**
     * @var App
     */
    private $app = [];

    /**
     * @return App
     */
    public function getApp()
    {
        return $this->app;
    }

    /**
     * @param App $app
     *
     * @return static
     */
    public function setApp(App $app)
    {
        $this->app = $app;

        return $this;
    }
}