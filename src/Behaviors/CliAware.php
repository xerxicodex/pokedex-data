<?php

namespace metaunicorn\Pokedata\Behaviors;

use metaunicorn\Pokedata\Cli;

trait CliAware
{
    /**
     * @var Cli
     */
    private $cli;

    /**
     * @return Cli
     */
    public function getCli()
    {
        if ( ! $this->cli) {
            $this->cli = Cli::createFromGlobals();
            if ( ! $this->isCli()) {
                $this->cli->setQuiet(true); // Mute if not CLI
            }
        }

        return $this->cli;
    }

    /**
     * @param Cli $cli
     *
     * @return static
     */
    public function setCli(Cli $cli)
    {
        $this->cli = $cli;

        return $this;
    }

    /**
     * @return bool
     */
    public function isCli()
    {
        return (php_sapi_name() === 'cli') || (PHP_SAPI === 'cli');
    }
}