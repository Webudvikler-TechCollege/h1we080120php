<?php
/**
 * @Description of classloader
 * Uses the Standard PHP Library (SPL) function
 * spl_autoload_register
 */
spl_autoload_register(function ($class) {
	// Sætter array med stier til klassemapper
	$paths = array("classes", "userapp");

	// Looper array og inkludere fil hvis den eksisterer
	foreach($paths as $path) {
		$file = COREROOT . $path . "/" . strtolower($class). '.php';
		if(file_exists($file)) {
			require_once $file;
		}
	}
});