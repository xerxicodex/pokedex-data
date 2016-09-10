<?php

namespace metaunicorn\Pokedata;

abstract class AppAware
{
    /**
     * @var App
     */
    private $app = [];

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

    /**
     * @return App
     */
    public function getApp()
    {
        return $this->app;
    }
}