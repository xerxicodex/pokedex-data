<?php

namespace metaunicorn\Pokedata\Csv;

use metaunicorn\Pokedata\Behaviors\CliAware;
use metaunicorn\Pokedata\Behaviors\DbAware;
use metaunicorn\Pokedata\Orm\Db;

/**
 * Base class for managing a directory containing CSV files with a DB
 */
class BaseDbHelper
{
    use CliAware;
    use DbAware;

    /**
     * @var string
     */
    private $csvPath;

    /**
     * BaseDbHelper constructor.
     *
     * @param string $csvPath
     * @param Db $db
     */
    public function __construct($csvPath, Db $db)
    {
        $this->setCsvPath($csvPath);
        $this->setDb($db);
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
}