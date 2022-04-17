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
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress_data' );

/** MySQL database username */
define( 'DB_USER', 'admin_wordpress' );

/** MySQL database password */
define( 'DB_PASSWORD', 'pass_wordpress' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

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
define( 'AUTH_KEY',         '-m13NO~FM&1f/S{[$SYbf]r9/k6 GwKYQv2!|;YV[v,-i,HqNl3X+P~FFEg-x|-x' );
define( 'SECURE_AUTH_KEY',  'UM&vo%6Q[m.E:y*t2?f2{syXI+~CLQK*/0=N~8987ohL}s^YrcZz+JEz[ (*gK$I' );
define( 'LOGGED_IN_KEY',    '@o@9mT#YU+4y76v1zIQWb| basSF_ToM&~#2ngn1r,<%.SyqG<KY&M=>^C>`R#x[' );
define( 'NONCE_KEY',        'v_X2<tonZKYYo&}Z%:Lg<~0WOI8fNq$n_G(Rr<E%!O{/^Xhk1|.bxOlp!z4>]SfS' );
define( 'AUTH_SALT',        'Eq&dp/[8aQ?qYo]Ww_=kYSahT:iXv->i0@U$%4wPAh^Q;:I]$_o@Ses< ^^J;yuK' );
define( 'SECURE_AUTH_SALT', '2xH,)7VpuXlpJhwd/p)6}7^U@K!|D!6nIx}xLe;Ah%vC7~sIjCw_xU~a/WZNDUDJ' );
define( 'LOGGED_IN_SALT',   'b,<i>C{#0@W:g=t0SI69YApH-NLhM*1>L|~=5+g<Lz% Q}@_6k-[xqKIAiM#Isoe' );
define( 'NONCE_SALT',       '{+{j{f]&}Siw 0`I|X5]O8*iv2E{2)9EK`R(24L,UV^G~G9,WuV7)X  wP]{bk*j' );

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
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
