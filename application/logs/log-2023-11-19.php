<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2023-11-19 08:17:04 --> Query error: Column 'status' in where clause is ambiguous - Invalid query: SELECT `u`.*, `sd`.*
FROM `users` `u`
JOIN `users_groups` `ug` ON `ug`.`user_id` = `u`.`id`
JOIN `seller_data` `sd` ON `sd`.`user_id` = `u`.`id`
WHERE `status` = '0'
AND `u`.`active` = 1
AND `ug`.`group_id` = '4'
ORDER BY `sd`.`id` DESC
 LIMIT 10
ERROR - 2023-11-19 08:17:04 --> Query error: Column 'status' in where clause is ambiguous - Invalid query: SELECT COUNT(u.id) as `total`
FROM `users` `u`
JOIN `users_groups` `ug` ON `ug`.`user_id` = `u`.`id`
JOIN `seller_data` `sd` ON `sd`.`user_id` = `u`.`id`
WHERE `status` = 1
AND `u`.`active` = 1
AND `ug`.`group_id` = '4'
ERROR - 2023-11-19 08:17:04 --> Query error: Column 'status' in where clause is ambiguous - Invalid query: SELECT `u`.*, `sd`.*
FROM `users` `u`
JOIN `users_groups` `ug` ON `ug`.`user_id` = `u`.`id`
JOIN `seller_data` `sd` ON `sd`.`user_id` = `u`.`id`
WHERE `status` = '2'
AND `u`.`active` = 1
AND `ug`.`group_id` = '4'
ORDER BY `sd`.`id` DESC
 LIMIT 10
ERROR - 2023-11-19 09:06:49 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1022
ERROR - 2023-11-19 09:07:00 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1022
ERROR - 2023-11-19 09:07:45 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1024
ERROR - 2023-11-19 09:31:22 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1022
ERROR - 2023-11-19 09:36:30 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1022
ERROR - 2023-11-19 09:36:37 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1022
ERROR - 2023-11-19 09:39:51 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1022
ERROR - 2023-11-19 09:46:45 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1021
ERROR - 2023-11-19 09:48:50 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1021
ERROR - 2023-11-19 09:49:12 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1021
ERROR - 2023-11-19 09:56:55 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1021
ERROR - 2023-11-19 10:01:30 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 424
ERROR - 2023-11-19 10:03:41 --> Severity: Warning --> Undefined variable $unit D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 358
ERROR - 2023-11-19 10:03:41 --> Severity: Warning --> foreach() argument must be of type array|object, null given D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 358
ERROR - 2023-11-19 10:03:41 --> Severity: Warning --> Undefined variable $unit D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 368
ERROR - 2023-11-19 10:03:41 --> Severity: Warning --> foreach() argument must be of type array|object, null given D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 368
ERROR - 2023-11-19 10:03:41 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 585
ERROR - 2023-11-19 10:03:47 --> Severity: Warning --> Undefined variable $unit D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 358
ERROR - 2023-11-19 10:03:47 --> Severity: Warning --> foreach() argument must be of type array|object, null given D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 358
ERROR - 2023-11-19 10:03:47 --> Severity: Warning --> Undefined variable $unit D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 368
ERROR - 2023-11-19 10:03:47 --> Severity: Warning --> foreach() argument must be of type array|object, null given D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 368
ERROR - 2023-11-19 10:03:47 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 585
ERROR - 2023-11-19 10:04:06 --> Severity: Warning --> Undefined variable $unit D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 358
ERROR - 2023-11-19 10:04:06 --> Severity: Warning --> foreach() argument must be of type array|object, null given D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 358
ERROR - 2023-11-19 10:04:06 --> Severity: Warning --> Undefined variable $unit D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 368
ERROR - 2023-11-19 10:04:06 --> Severity: Warning --> foreach() argument must be of type array|object, null given D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 368
ERROR - 2023-11-19 10:04:06 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 585
ERROR - 2023-11-19 10:04:29 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1021
ERROR - 2023-11-19 10:10:21 --> Severity: Warning --> Undefined variable $unit D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 350
ERROR - 2023-11-19 10:10:21 --> Severity: Warning --> foreach() argument must be of type array|object, null given D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 350
ERROR - 2023-11-19 10:10:21 --> Severity: Warning --> Undefined variable $unit D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 360
ERROR - 2023-11-19 10:10:21 --> Severity: Warning --> foreach() argument must be of type array|object, null given D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 360
ERROR - 2023-11-19 10:10:21 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 621
ERROR - 2023-11-19 10:11:11 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1021
ERROR - 2023-11-19 20:10:35 --> Query error: Column 'status' in where clause is ambiguous - Invalid query: SELECT `u`.*, `sd`.*
FROM `users` `u`
JOIN `users_groups` `ug` ON `ug`.`user_id` = `u`.`id`
JOIN `seller_data` `sd` ON `sd`.`user_id` = `u`.`id`
WHERE `status` = '0'
AND `u`.`active` = 1
AND `ug`.`group_id` = '4'
ORDER BY `sd`.`id` DESC
 LIMIT 10
ERROR - 2023-11-19 20:10:35 --> Query error: Column 'status' in where clause is ambiguous - Invalid query: SELECT COUNT(u.id) as `total`
FROM `users` `u`
JOIN `users_groups` `ug` ON `ug`.`user_id` = `u`.`id`
JOIN `seller_data` `sd` ON `sd`.`user_id` = `u`.`id`
WHERE `status` = 1
AND `u`.`active` = 1
AND `ug`.`group_id` = '4'
ERROR - 2023-11-19 20:10:35 --> Query error: Column 'status' in where clause is ambiguous - Invalid query: SELECT `u`.*, `sd`.*
FROM `users` `u`
JOIN `users_groups` `ug` ON `ug`.`user_id` = `u`.`id`
JOIN `seller_data` `sd` ON `sd`.`user_id` = `u`.`id`
WHERE `status` = '2'
AND `u`.`active` = 1
AND `ug`.`group_id` = '4'
ORDER BY `sd`.`id` DESC
 LIMIT 10
ERROR - 2023-11-19 20:10:42 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1186
ERROR - 2023-11-19 20:10:49 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1186
ERROR - 2023-11-19 20:11:02 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1021
