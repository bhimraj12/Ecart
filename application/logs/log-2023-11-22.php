<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2023-11-22 07:21:33 --> Query error: Column 'status' in where clause is ambiguous - Invalid query: SELECT `u`.*, `sd`.*
FROM `users` `u`
JOIN `users_groups` `ug` ON `ug`.`user_id` = `u`.`id`
JOIN `seller_data` `sd` ON `sd`.`user_id` = `u`.`id`
WHERE `status` = '0'
AND `u`.`active` = 1
AND `ug`.`group_id` = '4'
ORDER BY `sd`.`id` DESC
 LIMIT 10
ERROR - 2023-11-22 07:21:33 --> Query error: Column 'status' in where clause is ambiguous - Invalid query: SELECT COUNT(u.id) as `total`
FROM `users` `u`
JOIN `users_groups` `ug` ON `ug`.`user_id` = `u`.`id`
JOIN `seller_data` `sd` ON `sd`.`user_id` = `u`.`id`
WHERE `status` = 1
AND `u`.`active` = 1
AND `ug`.`group_id` = '4'
ERROR - 2023-11-22 07:21:33 --> Query error: Column 'status' in where clause is ambiguous - Invalid query: SELECT `u`.*, `sd`.*
FROM `users` `u`
JOIN `users_groups` `ug` ON `ug`.`user_id` = `u`.`id`
JOIN `seller_data` `sd` ON `sd`.`user_id` = `u`.`id`
WHERE `status` = '2'
AND `u`.`active` = 1
AND `ug`.`group_id` = '4'
ORDER BY `sd`.`id` DESC
 LIMIT 10
ERROR - 2023-11-22 07:22:01 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\forms\product.php 1021
ERROR - 2023-11-22 07:31:38 --> Could not find the language line "Text.send_mail"
ERROR - 2023-11-22 07:31:38 --> Could not find the language line "Text.send_mail"
ERROR - 2023-11-22 07:41:48 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\tables\manage-seller.php 142
ERROR - 2023-11-22 07:42:14 --> Severity: Warning --> Undefined variable $page D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\tables\manage-seller.php 134
ERROR - 2023-11-22 07:50:18 --> Severity: Warning --> Undefined variable $type D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\tables\manage-seller.php 97
ERROR - 2023-11-22 07:50:18 --> Severity: Warning --> Undefined variable $filter D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\tables\manage-seller.php 98
ERROR - 2023-11-22 07:53:27 --> Severity: Warning --> Undefined variable $type D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\tables\manage-seller.php 97
ERROR - 2023-11-22 07:53:27 --> Severity: Warning --> Undefined variable $filter D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\tables\manage-seller.php 98
ERROR - 2023-11-22 08:00:26 --> Severity: Warning --> Undefined variable $type D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\tables\manage-seller.php 97
ERROR - 2023-11-22 08:00:26 --> Severity: Warning --> Undefined variable $filter D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\tables\manage-seller.php 98
ERROR - 2023-11-22 08:00:33 --> Severity: Warning --> Undefined variable $type D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\tables\manage-seller.php 97
ERROR - 2023-11-22 08:00:33 --> Severity: Warning --> Undefined variable $filter D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\tables\manage-seller.php 98
ERROR - 2023-11-22 08:01:46 --> Severity: Warning --> Undefined variable $type D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\tables\manage-seller.php 97
ERROR - 2023-11-22 08:01:46 --> Severity: Warning --> Undefined variable $filter D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\tables\manage-seller.php 98
ERROR - 2023-11-22 08:01:56 --> Severity: Warning --> Undefined variable $type D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\tables\manage-seller.php 97
ERROR - 2023-11-22 08:01:56 --> Severity: Warning --> Undefined variable $filter D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\tables\manage-seller.php 98
ERROR - 2023-11-22 08:02:49 --> Severity: Warning --> Undefined variable $type D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\tables\manage-seller.php 97
ERROR - 2023-11-22 08:02:49 --> Severity: Warning --> Undefined variable $filter D:\Programming\SmitoxB2B\New Admin\Ecart\GitDesktop\application\views\admin\pages\tables\manage-seller.php 98
