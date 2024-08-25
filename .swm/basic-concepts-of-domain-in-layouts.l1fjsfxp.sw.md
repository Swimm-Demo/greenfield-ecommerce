---
title: Basic concepts of Domain in Layouts
---
Domain refers to the core business logic and data structure of the application.

In Layouts, the domain is represented by the `Layout` class, which defines the properties and behaviors of a layout entity.

The `Layout` class includes attributes such as `uuid`, `name`, `content`, `css`, `javascript`, `defaultLayout`, `dateCreated`, and `lastUpdated`.

The `uuid` is a unique identifier for each layout, generated automatically upon creation.

The `name` attribute is a mandatory field that must be unique for each layout.

The `content`, `css`, and `javascript` attributes store the layout's content and styling information.

The `defaultLayout` attribute indicates whether the layout is the default one.

The `dateCreated` and `lastUpdated` attributes track the creation and modification timestamps of the layout.

The `Layout` class also includes constraints and mappings to enforce data integrity and define how the data is stored in the database.

Domain Class Example The `Layout` class represents a domain entity with attributes like `uuid`, `name`, `content`, `css`, `javascript`, `defaultLayout`, `dateCreated`, and `lastUpdated`. It includes constraints and mappings to enforce data integrity and define how data is stored in the database.

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBZ3JlZW5maWVsZC1lY29tbWVyY2UlM0ElM0FTd2ltbS1EZW1v" repo-name="greenfield-ecommerce" doc-type="overview"><sup>Powered by [Swimm](/)</sup></SwmMeta>
