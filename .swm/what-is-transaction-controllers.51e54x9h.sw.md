---
title: What is Transaction Controllers
---
Controllers manage the flow of data between the model and the view.

They handle incoming HTTP requests, process them, and return the appropriate HTTP responses.

In Transactions, controllers are responsible for managing transaction-related operations such as listing transactions, showing transaction details, updating transaction status, deleting transactions, and handling refunds.

They ensure that only authorized users can perform certain actions by using security annotations like `@Secured`.

Controllers also interact with various services like `emailService`, `currencyService`, and `applicationService` to perform their tasks.

For example, the `send_confirmation` method sends an email confirmation for a transaction, while the `refund` method processes refunds through different payment processors.

Security Annotations They ensure that only authorized users can perform certain actions by using security annotations like `@Secured`.

Service Interactions Controllers also interact with various services like `emailService`, `currencyService`, and `applicationService` to perform their tasks.

Example Methods For example, the `send_confirmation` method sends an email confirmation for a transaction.

The `refund` method processes refunds through different payment processors.

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBZ3JlZW5maWVsZC1lY29tbWVyY2UlM0ElM0FTd2ltbS1EZW1v" repo-name="greenfield-ecommerce" doc-type="overview"><sup>Powered by [Swimm](/)</sup></SwmMeta>
