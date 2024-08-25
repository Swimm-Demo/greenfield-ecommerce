---
title: Getting started with Account Domain
---
Domain in Accounts refers to the `Account` class, which represents user accounts in the system.

The `Account` class includes various fields such as `uuid`, `username`, `email`, `password`, and other personal information like `name`, `address`, and `phone`.

It also contains fields for account status, such as `enabled`, `accountExpired`, `accountLocked`, and `passwordExpired`.

The `Account` class manages roles and permissions through methods like `createAccountPermission`, `createTransactionPermission`, and `createShoppingCartPermission`.

It also includes methods to create roles, such as `createAdminAccountRole` and `createAccountRoles`, which assign roles to the account.

The class uses constraints to enforce rules on the fields, such as making `username` and `email` unique and ensuring `password` has a minimum size.

# Account Class

The `Account` class includes fields such as `uuid`, `username`, `email`, `password`, and other personal information like `name`, `address`, and `phone`. It also contains fields for account status, such as `enabled`, `accountExpired`, `accountLocked`, and `passwordExpired`.

# Managing Roles and Permissions

The `Account` class manages roles and permissions through methods like `createAccountPermission`, `createTransactionPermission`, and `createShoppingCartPermission`. It also includes methods to create roles, such as `createAdminAccountRole` and `createAccountRoles`, which assign roles to the account.

# Constraints

The class uses constraints to enforce rules on the fields, such as making `username` and `email` unique and ensuring `password` has a minimum size.

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBZ3JlZW5maWVsZC1lY29tbWVyY2UlM0ElM0FTd2ltbS1EZW1v" repo-name="greenfield-ecommerce" doc-type="overview"><sup>Powered by [Swimm](/)</sup></SwmMeta>
