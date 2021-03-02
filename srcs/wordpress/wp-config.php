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
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', 'root' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

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
define('AUTH_KEY',         'IcT -+fq [K@Ux^XS_4kHjZ:p2si?.6LE/QR7vFb dl7oq&wg<B8V/s(7R5V!NN%');
define('SECURE_AUTH_KEY',  'P.yMAm1NK*S9%Vk# I(uovB#k,Q2weHu|?I0D1tgX`S.6zEW<@iic$-b_BojF]!/');
define('LOGGED_IN_KEY',    'm|v`msBN@d:q$od+>$Y58vQ%rB0BONIA:-mxi[w69!F6-^m8*2c[il//_>*?}LHN');
define('NONCE_KEY',        'Vt7G+P&>_3e#vZR=8RGJU=5hnA,Hp!;x+Db,|@r=RlY:8N1S}|6y(YPU_JKh.%yt');
define('AUTH_SALT',        '|=^60*w0Z3+Y;4!O+e[XI^++>;|5.(=q+n83=Vlu)H(avUK^a3y{O8W?.SgeI<l9');
define('SECURE_AUTH_SALT', 'E-q(!|m5DcFg$I==6w1RZ jjv5|X}p4O*/e>J48Q3F-bk>gzf4u=tK[_BEFWi9z7');
define('LOGGED_IN_SALT',   'G-r-Noajcp]uf_<r.oRg~%<*tL|r%r?|%Kq$|XHw?HcD*DTuniWTF_aG0D R*q[|');
define('NONCE_SALT',       '6BEqI9-**ZP6@lMhf*nf,p-+*lbWI*0{vDT{Mu/&t-G(32zys-@2v)y6e6Z`ECZq');

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