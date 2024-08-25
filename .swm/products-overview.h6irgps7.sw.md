---
title: Products Overview
---
Products are core entities representing the items available for sale.

Each product has attributes such as name, description, price, and category.

Products can have multiple options and variants, allowing for different configurations and choices for customers.

The <SwmToken path="grails-app/controllers/greenfield/ProductController.groovy" pos="28:2:2" line-data="class ProductController {">`ProductController`</SwmToken> manages the CRUD operations for products, including creating, updating, and deleting products.

The views associated with products, such as <SwmPath>[grails-app/views/catalog/create.gsp](grails-app/views/catalog/create.gsp)</SwmPath>, <SwmPath>[grails-app/views/catalog/edit.gsp](grails-app/views/catalog/edit.gsp)</SwmPath>, and <SwmPath>[grails-app/views/product/list.gsp](grails-app/views/product/list.gsp)</SwmPath>, provide the user interface for managing products.

The <SwmPath>[grails-app/views/product/product_options.gsp](grails-app/views/product/product_options.gsp)</SwmPath> view allows administrators to manage product options and variants, enhancing the flexibility of product offerings.

<SwmSnippet path="/grails-app/controllers/greenfield/ProductController.groovy" line="216">

---

## Managing Products

The <SwmToken path="grails-app/controllers/greenfield/ProductController.groovy" pos="28:2:2" line-data="class ProductController {">`ProductController`</SwmToken> manages the CRUD operations for products, including creating, updating, and deleting products.

```groovy
				flash.message = "You must create at least one Catalog before creating Products"
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/views/product/list.gsp" line="12">

---

## Product Views

The <SwmPath>[grails-app/views/product/list.gsp](grails-app/views/product/list.gsp)</SwmPath> view provides the user interface for listing products.

```groovy server pages
		<title>Greenfield : Products</title>
```

---

</SwmSnippet>

# Product <SwmToken path="grails-app/views/product/details.gsp" pos="245:9:9" line-data="		&lt;script src=&quot;https://apis.google.com/js/platform.js&quot; async defer&gt;&lt;/script&gt;">`apis`</SwmToken>

Product <SwmToken path="grails-app/views/product/details.gsp" pos="245:9:9" line-data="		&lt;script src=&quot;https://apis.google.com/js/platform.js&quot; async defer&gt;&lt;/script&gt;">`apis`</SwmToken>

<SwmSnippet path="/grails-app/views/product/details.gsp" line="1">

---

## details

The <SwmToken path="grails-app/views/product/details.gsp" pos="15:24:24" line-data="${raw(applicationService.getProductHeader(catalogInstance, productInstance, &quot;${productInstance?.name} Product Details&quot;, true, params))}">`Details`</SwmToken> endpoint is used to display the detailed view of a product. It includes product images, descriptions, prices, and other relevant information. This endpoint is accessed via the <SwmToken path="grails-app/controllers/greenfield/ProductController.groovy" pos="28:2:2" line-data="class ProductController {">`ProductController`</SwmToken> and renders the <SwmPath>[grails-app/views/product/details.gsp](grails-app/views/product/details.gsp)</SwmPath> view.

```groovy server pages
<%@ page import="org.greenfield.ApplicationService" %>
<%@ page import="java.util.Map" %>
<% def applicationService = grailsApplication.classLoader.loadClass('org.greenfield.ApplicationService').newInstance()
%>
<% def currencyService = grailsApplication.classLoader.loadClass('org.greenfield.CurrencyService').newInstance()%>

<%
	def catalogInstance = null
	def productCatalogIds = productInstance.catalogs.collect{ it.id }
	if(session.catalogInstance && productCatalogIds.contains(session?.catalogInstance?.id)){
		catalogInstance = session.catalogInstance
	}
%>
	
${raw(applicationService.getProductHeader(catalogInstance, productInstance, "${productInstance?.name} Product Details", true, params))}


<% if(catalogInstance){ %>
	<div class="breadcrumbs">
		${raw(applicationService.getBreadcrumbs(catalogInstance))}
	</div>
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/views/product/search.gsp" line="1">

---

## search

The <SwmToken path="grails-app/views/product/search.gsp" pos="6:9:9" line-data="${raw(applicationService.getDefaultHeader(&quot;Search Results&quot;))}">`Search`</SwmToken> endpoint allows users to search for products based on a query. It displays the search results, including product names, images, and prices. This endpoint is accessed via the <SwmToken path="grails-app/controllers/greenfield/ProductController.groovy" pos="28:2:2" line-data="class ProductController {">`ProductController`</SwmToken> and renders the <SwmPath>[grails-app/views/product/search.gsp](grails-app/views/product/search.gsp)</SwmPath> view.

```groovy server pages
<%@ page import="org.greenfield.ApplicationService" %>
<% def applicationService = grailsApplication.classLoader.loadClass('org.greenfield.ApplicationService').newInstance()
%>
<% def currencyService = grailsApplication.classLoader.loadClass('org.greenfield.CurrencyService').newInstance()%>

${raw(applicationService.getDefaultHeader("Search Results"))}

<h3>Search Results for "${query}"</h3>
			
<g:if test="${flash.message}">
	<div class="alert alert-info" role="status">${flash.message}</div>
</g:if>
			
<g:if test="${products?.size() > 0}">
	

	<div class="catalog-products-header-pagination">
		<g:paginate 
			max="12"
			maxsteps="5"
			total="${products.totalCount}"
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBZ3JlZW5maWVsZC1lY29tbWVyY2UlM0ElM0FTd2ltbS1EZW1v" repo-name="greenfield-ecommerce" doc-type="overview"><sup>Powered by [Swimm](/)</sup></SwmMeta>
