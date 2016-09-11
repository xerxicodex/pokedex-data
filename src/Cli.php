<?php

namespace metaunicorn\Pokedata;

/**
 * Represents a Command-Line Interface PHP application
 */
class Cli
{
    /**
     * @var array
     */
    private $arguments;

    /**
     * @var array
     */
    private $options;

    /**
     * @var bool
     */
    private $quiet = false;

    /**
     * Cli constructor.
     *
     * @param array $arguments
     * @param array $options
     */
    public function __construct(array $arguments, array $options)
    {
        $this->setArguments($arguments);
        $this->setOptions($options);
        $this->setQuiet($this->getOption('q', false) || $this->getOption('quiet', false));
    }

    public static function createFromGlobals()
    {
        global $argv, $argc;

        // CLI parser
        $arguments = [];
        $options   = [];

        if ($argc > 1) {
            foreach ($argv as $i => $arg) {
                if ($i == 0) {
                    continue;
                }
                $isOption = preg_match('/^-/', $arg);
                if ( ! $isOption) {
                    $arguments[] = $arg;
                    continue;
                }
                $arg = explode('=', ltrim($arg, '- '), 2);
                if (count($arg) == 1) {
                    $options[$arg[0]] = true;
                } elseif (count($arg) == 2) {
                    if (isset($options[$arg[0]])) {
                        // Support arrays
                        $options[$arg[0]]   = (array)$options[$arg[0]];
                        $options[$arg[0]][] = $arg[1];
                    } else {
                        $options[$arg[0]] = $arg[1];
                    }
                }
            }
        }

        return new static($arguments, $options);
    }

    /**
     * @param string $name
     * @param mixed|null $default
     *
     * @return array
     */
    public function getOption($name, $default = null)
    {
        return isset($this->options[$name]) ? $this->options[$name] : $default;
    }

    /**
     * @return array
     */
    public function getArguments()
    {
        return $this->arguments;
    }

    /**
     * @param array $arguments
     *
     * @return static
     */
    public function setArguments(array $arguments)
    {
        $this->arguments = $arguments;

        return $this;
    }

    /**
     * @param array $options
     *
     * @return static
     */
    public function setOptions(array $options)
    {
        $this->options = $options;

        return $this;
    }

    /**
     * @return array
     */
    public function getOptions()
    {
        return $this->options;
    }

    /**
     * @param string|mixed $text
     *
     * @return bool
     */
    public function write($text)
    {
        if ( ! is_scalar($text)) {
            $text = var_export($text, true);
        } else {
            $text = strval($text);
        }
        if ( ! $this->isQuiet()) {
            print $text;

            return true;
        }

        return false;
    }

    /**
     * @param string|mixed $text
     *
     * @return bool
     */
    public function writeLn($text)
    {
        $this->write($text);

        if ( ! $this->isQuiet()) {
            print PHP_EOL;

            return true;
        }

        return false;
    }

    /**
     * @return boolean
     */
    public function isQuiet()
    {
        return $this->quiet;
    }

    /**
     * @param boolean $quiet
     *
     * @return static
     */
    public function setQuiet($quiet)
    {
        $this->quiet = $quiet;

        return $this;
    }

}