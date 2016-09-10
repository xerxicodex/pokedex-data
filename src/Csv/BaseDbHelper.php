<?php

namespace metaunicorn\Pokedata\Csv;

use metaunicorn\Pokedata\App;
use metaunicorn\Pokedata\AppAware;
use metaunicorn\Pokedata\Cli;
use metaunicorn\Pokedata\Orm\Db;

/**
 * Base class for managing a directory containing CSV files with a DB
 */
class BaseDbHelper extends AppAware
{

    /**
     * @var string
     */
    private $csvPath;

    /**
     * BaseDbHelper constructor.
     *
     * @param string $csvPath
     * @param App $app
     */
    public function __construct($csvPath, App $app)
    {
        $this->setCsvPath($csvPath);
        $this->setApp($app);
    }


    /**
     * Sets the CSV Path
     *
     * @param string $csvPath
     *
     * @return static
     */
    public function setCsvPath($csvPath)
    {
        $this->csvPath = rtrim($csvPath, DIRECTORY_SEPARATOR);

        return $this;
    }

    /**
     * Returns the CSV Path
     * @return string
     */
    public function getCsvPath()
    {
        return $this->csvPath;
    }

    /**
     * Returns all CSV files relative to the CSV path
     * @return string[]
     */
    public function getCsvFiles()
    {
        $basePath = $this->csvPath;

        return array_values(array_filter(scandir($basePath), function ($path) use ($basePath) {
            return (
                // Check it's not a dir
                (
                    ($path != '.')
                    && ($path != '..')
                    && ! is_dir($basePath . DIRECTORY_SEPARATOR . $path)
                )
                // Check extension
                && preg_match('/\.csv$/', $path)
            );
        }));
    }

    /**
     * @return Db
     */
    public function getDb()
    {
        return $this->getApp()->getDb();
    }

    /**
     * @return Cli
     */
    public function getCli()
    {
        return $this->getApp()->getCli();
    }
}