<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '040319659' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '$JiPm}w)&3(fRH[o<US_q9.x%t8|mHlUAr#QndGe(v,&26E$7&#Q!)|H2YS!{IP[' );
define( 'SECURE_AUTH_KEY',  '*;@iACcL>_vqGti>}X*Jnc9X[O-Btz2N80jeO!E?G|D$a{n6>0KNA=^xJ_l0FpTa' );
define( 'LOGGED_IN_KEY',    'W&9BW9([kbW#PGqU]<%(z527hHhWM#1e7vhDCY,>1:621AgZdpt-YSAEi~L0Y0vS' );
define( 'NONCE_KEY',        'l0eR[^;R|O91A|ih}wF sIC#.0VDp973!gd.][ofg5$cn`=5fr;*-7_xOV#sQs&@' );
define( 'AUTH_SALT',        'kv>n!2H/*LYsYZaMt}9#mg^V0nHlm.~7{~;@ZP`%cMr*8=Ie<xq(W^CU|lQ&6bC0' );
define( 'SECURE_AUTH_SALT', '{Z_@G B(;^d:65^37cYQW4PF#tn]5!@vS#$G2})C{Z)rcieL{vXLT|%LcvX_ig,<' );
define( 'LOGGED_IN_SALT',   '&UM-P+|i{$3D-$~SuhC70.:rgl<Z0(y%W[+c.H1q=:r4ncbTQ.4hpbAm*-9u<i0|' );
define( 'NONCE_SALT',       '#%g]XQSpX?m6tmCpj1t#@AZ_jfF>wDW<C;cG:6k l}k|<5=nN%30.@f=TbH=F`;-' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
