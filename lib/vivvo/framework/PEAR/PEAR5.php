<?php
/* =============================================================================
 * $Revision: 4824 $
 * $Date: 2010-03-29 17:03:03 +0200 (Mon, 29 Mar 2010) $
 *
 * Vivvo CMS ${X_VERSION} (build ${X_REVISION})
 *
 * ${X_CODE_COPYRIGHT:m}
 *
 * ${X_CODE_LICENSE:m}
 * =============================================================================
 */
class PEAR5
{
    /**
    * If you have a class that's mostly/entirely static, and you need static
    * properties, you can use this method to simulate them. Eg. in your method(s)
    * do this: $myVar = &PEAR5::getStaticProperty('myclass', 'myVar');
    * You MUST use a reference, or they will not persist!
    *
    * @access public
    * @param  string $class  The calling classname, to prevent clashes
    * @param  string $var    The variable to retrieve.
    * @return mixed   A reference to the variable. If not set it will be
    *                 auto initialised to NULL.
    */
    static function &getStaticProperty($class, $var)
    {
        static $properties;
        if (!isset($properties[$class])) {
            $properties[$class] = array();
        }

        if (!array_key_exists($var, $properties[$class])) {
            $properties[$class][$var] = null;
        }

        return $properties[$class][$var];
    }
}