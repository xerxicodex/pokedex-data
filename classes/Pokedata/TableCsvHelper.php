<?php

namespace metaunicorn\Pokedata;

/**
 * Base class for managing a directory containing CSV files with a DB
 */
class TableCsvHelper extends PdoHelper
{
    /**
     * @var string
     */
    private $csvPath;

    /**
     * @var bool
     */
    private $verbose = true;

    /**
     * CsvDbHelper constructor.
     * @param string $csvPath
     * @param \PDO|null $db
     */
    public function __construct($csvPath, \PDO $db = null)
    {
        if ($db) {
            $this->setDb($db);
        }
        $this->setPath($csvPath);
    }

    /**
     * Sets the CSV Path
     * @param string $csvPath
     * @return TableCsvHelper
     */
    public function setPath($csvPath)
    {
        $this->csvPath = rtrim($csvPath, DIRECTORY_SEPARATOR);
        return $this;
    }

    /**
     * Returns the CSV Path
     * @return string
     */
    public function getPath()
    {
        return $this->csvPath;
    }

    /**
     * Returns all CSV files relative to the CSV path
     * @return string[]
     */
    public function getFiles()
    {
        $basePath = $this->csvPath;
        return array_values(array_filter(scandir($basePath), function ($path) use ($basePath) {
            return (
                // Check it's not a dir
                (
                    ($path != '.')
                    && ($path != '..')
                    && !is_dir($basePath . DIRECTORY_SEPARATOR . $path)
                )
                // Check extension
                && preg_match('/\.csv$/', $path)
            );
        }));
    }

    /**
     * Prints a message into the output.
     * Ignored if verbose mode is off.
     *
     * @param $message
     * @return bool
     */
    public function log($message)
    {
        if ($this->verbose) {
            print $message . PHP_EOL;
            return true;
        }
        return false;
    }

    /**
     * @param bool $verbose
     * @return TableCsvHelper
     */
    public function setVerbose($verbose)
    {
        $this->verbose = $verbose;
        return $this;
    }

    /**
     * @return bool
     */
    public function getVerbose()
    {
        return $this->verbose;
    }
}