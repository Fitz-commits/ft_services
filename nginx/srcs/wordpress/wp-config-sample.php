<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress_db' );

/** MySQL database username */
define( 'DB_USER', 'chris' );

/** MySQL database password */
define( 'DB_PASSWORD', 'Etterbeek354' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '|` Zt`}1N7RA~+70PX9%V|zzC)[d$LyU3UDazFEXLc*Q+m7fO4{P,(O>R&f#i8YS');
define('SECURE_AUTH_KEY',  'i`n8hvz9pjsL%qTDcowaO=Y{}@VMbD*o<Bd#f>T4I4zq`@$-@NM+pQ;N`+8t hLJ');
define('LOGGED_IN_KEY',    'c2ml:(Sx.8(-`MdF;I:77}MWLSF|[U%O^aq+dB0R U854!vvNUGDq.=eo5ZES>OF');
define('NONCE_KEY',        '[$x(j~jZXMhCI>3u3*`NqNbh6d^YK:({vI-+&Iguw/gr$?rZI1A}sISAw{JMOn$p');
define('AUTH_SALT',        '2@y<~=Pv{N2)[}3EfiDJ*r;-h3!(K$nu-9P{x#cE#cPe?CB+y^O4IM5u;*Y-*Y+:');
define('SECURE_AUTH_SALT', '%gwa+Wr+W-NH<-/[ml{Lm_cNz_$GpwVTG|bcVH5:Na^!*y},/Y9YHQ-bYB4)6AqT');
define('LOGGED_IN_SALT',   'DB-;Zb4xH+s-,nv;ANMQk`}jpnp;/[i@`3-i$JkswJ{:yT=+NFefmo1/Q6q+~+iP');
define('NONCE_SALT',       'w=-~2TC+b`@gbX[`n!/e(S!]|,] @$4|^$(pOvd@dEA[+-K56[m|o@NoG|r :2T]');
/**#@-*/

/**
 * WordPress Database Table prefix.
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
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
