<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2023-12-10 08:11:29 --> Query error: Column 'status' in where clause is ambiguous - Invalid query: SELECT `u`.*, `sd`.*
FROM `users` `u`
JOIN `users_groups` `ug` ON `ug`.`user_id` = `u`.`id`
JOIN `seller_data` `sd` ON `sd`.`user_id` = `u`.`id`
WHERE `status` = '0'
AND `u`.`active` = 1
AND `ug`.`group_id` = '4'
ORDER BY `sd`.`id` DESC
 LIMIT 10
ERROR - 2023-12-10 08:11:29 --> Query error: Column 'status' in where clause is ambiguous - Invalid query: SELECT COUNT(u.id) as `total`
FROM `users` `u`
JOIN `users_groups` `ug` ON `ug`.`user_id` = `u`.`id`
JOIN `seller_data` `sd` ON `sd`.`user_id` = `u`.`id`
WHERE `status` = 1
AND `u`.`active` = 1
AND `ug`.`group_id` = '4'
ERROR - 2023-12-10 08:11:29 --> Query error: Column 'status' in where clause is ambiguous - Invalid query: SELECT `u`.*, `sd`.*
FROM `users` `u`
JOIN `users_groups` `ug` ON `ug`.`user_id` = `u`.`id`
JOIN `seller_data` `sd` ON `sd`.`user_id` = `u`.`id`
WHERE `status` = '2'
AND `u`.`active` = 1
AND `ug`.`group_id` = '4'
ORDER BY `sd`.`id` DESC
 LIMIT 10
ERROR - 2023-12-10 09:27:21 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1186
ERROR - 2023-12-10 09:31:03 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1185
ERROR - 2023-12-10 09:33:04 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1035
ERROR - 2023-12-10 09:38:20 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1035
ERROR - 2023-12-10 09:38:25 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1035
ERROR - 2023-12-10 09:38:48 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1035
ERROR - 2023-12-10 09:41:37 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1035
ERROR - 2023-12-10 10:19:43 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1037
ERROR - 2023-12-10 10:24:44 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1035
ERROR - 2023-12-10 10:40:27 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1035
ERROR - 2023-12-10 10:49:39 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1035
ERROR - 2023-12-10 10:50:42 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1036
ERROR - 2023-12-10 10:52:06 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1043
ERROR - 2023-12-10 11:00:43 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1036
ERROR - 2023-12-10 11:24:25 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1044
ERROR - 2023-12-10 11:26:23 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1036
ERROR - 2023-12-10 11:27:41 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1035
ERROR - 2023-12-10 11:30:18 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1036
