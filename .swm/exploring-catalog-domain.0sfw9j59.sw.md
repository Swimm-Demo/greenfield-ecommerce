---
title: Exploring Catalog Domain
---
The Catalog Domain represents the structure and organization of product categories within the application.

Each catalog can have a unique identifier, name, description, and layout, which helps in defining its properties and appearance.

Catalogs can be nested, allowing for a hierarchical organization where a catalog can have subcatalogs and a parent catalog.

The <SwmToken path="grails-app/domain/org/greenfield/Catalog.groovy" pos="18:3:3" line-data="	boolean toplevel">`toplevel`</SwmToken> attribute indicates whether a catalog is a top-level category, and the <SwmToken path="grails-app/domain/org/greenfield/Catalog.groovy" pos="19:3:3" line-data="	int position">`position`</SwmToken> attribute helps in sorting the catalogs.

The domain also includes metadata such as the date of creation and the last update, which are useful for tracking changes.

Constraints and mappings are defined to ensure data integrity and proper ordering of catalogs.

<SwmSnippet path="/grails-app/domain/org/greenfield/Catalog.groovy" line="1">

---

Catalog Class Definition The <SwmToken path="grails-app/domain/org/greenfield/Catalog.groovy" pos="3:2:2" line-data="class Catalog {">`Catalog`</SwmToken> class defines the structure of a catalog, including attributes like <SwmToken path="grails-app/domain/org/greenfield/Catalog.groovy" pos="6:3:3" line-data="		this.uuid = UUID.randomUUID().toString()">`uuid`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Catalog.groovy" pos="11:3:3" line-data="	String name">`name`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Catalog.groovy" pos="12:3:3" line-data="	String description">`description`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Catalog.groovy" pos="13:1:1" line-data="	Layout layout">`Layout`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Catalog.groovy" pos="15:3:3" line-data="	Date dateCreated">`dateCreated`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Catalog.groovy" pos="16:3:3" line-data="	Date lastUpdated">`lastUpdated`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Catalog.groovy" pos="18:3:3" line-data="	boolean toplevel">`toplevel`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Catalog.groovy" pos="19:3:3" line-data="	int position">`position`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Catalog.groovy" pos="21:3:3" line-data="	Catalog parentCatalog">`parentCatalog`</SwmToken>, and <SwmToken path="grails-app/domain/org/greenfield/Catalog.groovy" pos="23:9:9" line-data="	static hasMany = [ subcatalogs: Catalog ]">`subcatalogs`</SwmToken>. It also includes mappings and constraints to ensure data integrity and proper ordering.

```groovy
package org.greenfield

class Catalog {
	
	Catalog(){
		this.uuid = UUID.randomUUID().toString()
	}
	
	String uuid

	String name
	String description
	Layout layout

	Date dateCreated
	Date lastUpdated
	
	boolean toplevel
	int position

	Catalog parentCatalog
```

---

</SwmSnippet>

# Main functions

There are several main functions in this domain. Some of them are managing unique identifiers, names, descriptions, layouts, hierarchical organization, and metadata. We will dive a little into managing unique identifiers and hierarchical organization.

<SwmSnippet path="/grails-app/domain/org/greenfield/Catalog.groovy" line="3">

---

## Managing Unique Identifiers

The <SwmToken path="grails-app/domain/org/greenfield/Catalog.groovy" pos="3:2:2" line-data="class Catalog {">`Catalog`</SwmToken> class constructor initializes a unique identifier for each catalog instance using <SwmToken path="grails-app/domain/org/greenfield/Catalog.groovy" pos="6:7:15" line-data="		this.uuid = UUID.randomUUID().toString()">`UUID.randomUUID().toString()`</SwmToken>. This ensures that each catalog has a distinct identifier.

```groovy
class Catalog {
	
	Catalog(){
		this.uuid = UUID.randomUUID().toString()
	}
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/domain/org/greenfield/Catalog.groovy" line="21">

---

## Hierarchical Organization

The <SwmToken path="grails-app/domain/org/greenfield/Catalog.groovy" pos="21:1:1" line-data="	Catalog parentCatalog">`Catalog`</SwmToken> class supports hierarchical organization through the <SwmToken path="grails-app/domain/org/greenfield/Catalog.groovy" pos="21:3:3" line-data="	Catalog parentCatalog">`parentCatalog`</SwmToken> attribute and the <SwmToken path="grails-app/domain/org/greenfield/Catalog.groovy" pos="23:3:3" line-data="	static hasMany = [ subcatalogs: Catalog ]">`hasMany`</SwmToken> relationship with <SwmToken path="grails-app/domain/org/greenfield/Catalog.groovy" pos="23:9:9" line-data="	static hasMany = [ subcatalogs: Catalog ]">`subcatalogs`</SwmToken>. This allows catalogs to be nested, creating a tree-like structure.

```groovy
	Catalog parentCatalog

	static hasMany = [ subcatalogs: Catalog ]
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBZ3JlZW5maWVsZC1lY29tbWVyY2UlM0ElM0FTd2ltbS1EZW1v" repo-name="greenfield-ecommerce" doc-type="overview"><sup>Powered by [Swimm](/)</sup></SwmMeta>
