---
title: Understanding Product Entity
---
The Product Domain refers to the core entity representing products in the eCommerce application.

It includes attributes such as <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="10:3:3" line-data="	String uuid">`uuid`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="12:3:3" line-data="	String name">`name`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="13:3:3" line-data="	String description">`description`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="15:3:3" line-data="	int quantity">`quantity`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="16:3:3" line-data="	BigDecimal price">`price`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="17:3:3" line-data="	BigDecimal salesPrice">`salesPrice`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="19:3:3" line-data="	String imageUrl">`imageUrl`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="20:3:3" line-data="	String detailsImageUrl">`detailsImageUrl`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="22:3:3" line-data="	Date dateCreated">`dateCreated`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="23:3:3" line-data="	Date lastUpdated">`lastUpdated`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="25:3:3" line-data="	boolean disabled">`disabled`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="26:3:3" line-data="	boolean purchaseable">`purchaseable`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="28:3:3" line-data="	double length">`length`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="29:3:3" line-data="	double width">`width`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="30:3:3" line-data="	double height">`height`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="63:1:1" line-data="		weight(nullable:false)">`weight`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="64:1:1" line-data="		productNo(nullable:true)">`productNo`</SwmToken>, and <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="65:1:1" line-data="		harmonizedCode(nullable:true)">`harmonizedCode`</SwmToken>.

The <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="3:2:2" line-data="class Product {">`Product`</SwmToken> class also defines relationships with other entities like <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="39:12:12" line-data="	static hasMany = [ catalogs: Catalog, additionalPhotos: AdditionalPhoto, productOptions: ProductOption, productSpecifications: ProductSpecification ]">`Catalog`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="39:18:18" line-data="	static hasMany = [ catalogs: Catalog, additionalPhotos: AdditionalPhoto, productOptions: ProductOption, productSpecifications: ProductSpecification ]">`AdditionalPhoto`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="39:24:24" line-data="	static hasMany = [ catalogs: Catalog, additionalPhotos: AdditionalPhoto, productOptions: ProductOption, productSpecifications: ProductSpecification ]">`ProductOption`</SwmToken>, and <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="39:30:30" line-data="	static hasMany = [ catalogs: Catalog, additionalPhotos: AdditionalPhoto, productOptions: ProductOption, productSpecifications: ProductSpecification ]">`ProductSpecification`</SwmToken> through the <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="39:3:3" line-data="	static hasMany = [ catalogs: Catalog, additionalPhotos: AdditionalPhoto, productOptions: ProductOption, productSpecifications: ProductSpecification ]">`hasMany`</SwmToken> property.

The <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="42:3:3" line-data="	static mapping = {">`mapping`</SwmToken> block specifies how certain fields should be handled in the database, such as setting the <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="13:3:3" line-data="	String description">`description`</SwmToken> field to type <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="43:7:7" line-data="		description type: &quot;text&quot;">`text`</SwmToken> and defining cascading delete operations for related entities.

The <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="49:3:3" line-data="    static constraints = {">`constraints`</SwmToken> block enforces rules on the attributes, such as making the <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="12:3:3" line-data="	String name">`name`</SwmToken> field non-nullable and unique, and setting default values for <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="25:3:3" line-data="	boolean disabled">`disabled`</SwmToken> and <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="26:3:3" line-data="	boolean purchaseable">`purchaseable`</SwmToken> fields.

<SwmSnippet path="/grails-app/domain/org/greenfield/Product.groovy" line="10">

---

Attributes The <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="3:2:2" line-data="class Product {">`Product`</SwmToken> class includes attributes such as <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="10:3:3" line-data="	String uuid">`uuid`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="12:3:3" line-data="	String name">`name`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="13:3:3" line-data="	String description">`description`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="15:3:3" line-data="	int quantity">`quantity`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="16:3:3" line-data="	BigDecimal price">`price`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="17:3:3" line-data="	BigDecimal salesPrice">`salesPrice`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="19:3:3" line-data="	String imageUrl">`imageUrl`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="20:3:3" line-data="	String detailsImageUrl">`detailsImageUrl`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="22:3:3" line-data="	Date dateCreated">`dateCreated`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="23:3:3" line-data="	Date lastUpdated">`lastUpdated`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="25:3:3" line-data="	boolean disabled">`disabled`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="26:3:3" line-data="	boolean purchaseable">`purchaseable`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="28:3:3" line-data="	double length">`length`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="29:3:3" line-data="	double width">`width`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="30:3:3" line-data="	double height">`height`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="63:1:1" line-data="		weight(nullable:false)">`weight`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="64:1:1" line-data="		productNo(nullable:true)">`productNo`</SwmToken>, and <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="65:1:1" line-data="		harmonizedCode(nullable:true)">`harmonizedCode`</SwmToken>.

```groovy
	String uuid
	
	String name
	String description
	
	int quantity
	BigDecimal price
	BigDecimal salesPrice
	
	String imageUrl
	String detailsImageUrl
	
	Date dateCreated
	Date lastUpdated
	
	boolean disabled
	boolean purchaseable
	
	double length
	double width
	double height
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/domain/org/greenfield/Product.groovy" line="39">

---

Relationships The <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="3:2:2" line-data="class Product {">`Product`</SwmToken> class defines relationships with other entities like <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="39:12:12" line-data="	static hasMany = [ catalogs: Catalog, additionalPhotos: AdditionalPhoto, productOptions: ProductOption, productSpecifications: ProductSpecification ]">`Catalog`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="39:18:18" line-data="	static hasMany = [ catalogs: Catalog, additionalPhotos: AdditionalPhoto, productOptions: ProductOption, productSpecifications: ProductSpecification ]">`AdditionalPhoto`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="39:24:24" line-data="	static hasMany = [ catalogs: Catalog, additionalPhotos: AdditionalPhoto, productOptions: ProductOption, productSpecifications: ProductSpecification ]">`ProductOption`</SwmToken>, and <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="39:30:30" line-data="	static hasMany = [ catalogs: Catalog, additionalPhotos: AdditionalPhoto, productOptions: ProductOption, productSpecifications: ProductSpecification ]">`ProductSpecification`</SwmToken> through the <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="39:3:3" line-data="	static hasMany = [ catalogs: Catalog, additionalPhotos: AdditionalPhoto, productOptions: ProductOption, productSpecifications: ProductSpecification ]">`hasMany`</SwmToken> property.

```groovy
	static hasMany = [ catalogs: Catalog, additionalPhotos: AdditionalPhoto, productOptions: ProductOption, productSpecifications: ProductSpecification ]
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/domain/org/greenfield/Product.groovy" line="42">

---

Database Mapping The <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="42:3:3" line-data="	static mapping = {">`mapping`</SwmToken> block specifies how certain fields should be handled in the database, such as setting the <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="43:1:1" line-data="		description type: &quot;text&quot;">`description`</SwmToken> field to type <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="43:7:7" line-data="		description type: &quot;text&quot;">`text`</SwmToken> and defining cascading delete operations for related entities.

```groovy
	static mapping = {
		description type: "text"
        additionalPhotos cascade: 'all-delete-orphan'
        productOptions cascade: 'all-delete-orphan'
        productSpecifications cascade: "all-delete-orphan"
	}
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/domain/org/greenfield/Product.groovy" line="49">

---

Constraints The <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="49:3:3" line-data="    static constraints = {">`constraints`</SwmToken> block enforces rules on the attributes, such as making the <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="51:1:1" line-data="		name(nullable:false, unique:true)">`name`</SwmToken> field non-nullable and unique, and setting default values for <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="57:1:1" line-data="		disabled(nullable:true, default:false)">`disabled`</SwmToken> and <SwmToken path="grails-app/domain/org/greenfield/Product.groovy" pos="58:1:1" line-data="		purchaseable(nullable:true, default:true)">`purchaseable`</SwmToken> fields.

```groovy
    static constraints = {
		uuid(nullable:true)
		name(nullable:false, unique:true)
		description(nullable:true,size:0..65535)
		quantity(nullable:false)
		price(nullable:false)
		salesPrice(nullable:true)
		imageUrl(nullable:true)
		disabled(nullable:true, default:false)
		purchaseable(nullable:true, default:true)
		detailsImageUrl(nullable:true)
		length(nullable:true)
		width(nullable:true)
		height(nullable:true)
		weight(nullable:false)
		productNo(nullable:true)
		harmonizedCode(nullable:true)
		id generator: 'sequence', params:[sequence:'ID_PRODUCT_PK_SEQ']
    }
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBZ3JlZW5maWVsZC1lY29tbWVyY2UlM0ElM0FTd2ltbS1EZW1v" repo-name="greenfield-ecommerce" doc-type="overview"><sup>Powered by [Swimm](/)</sup></SwmMeta>
