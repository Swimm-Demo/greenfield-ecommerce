---
title: Understanding Product Views in Products
---
Product Views refer to the various Groovy Server Pages (GSP) that render the user interface for product-related functionalities.

These views include pages for displaying product options, adding new product options, and showing detailed product information.

The <SwmPath>[grails-app/views/product/product_options.gsp](grails-app/views/product/product_options.gsp)</SwmPath> file provides a view for managing product options, allowing users to add, order, and edit options for a specific product.

The <SwmPath>[grails-app/views/product/add_product_option.gsp](grails-app/views/product/add_product_option.gsp)</SwmPath> file offers a form for adding new product options, including fields for the option name and associated product.

The <SwmPath>[grails-app/views/product/show.old](grails-app/views/product/show.old)</SwmPath> file displays detailed information about a product, including its name, price, quantity, and various attributes like catalogs, images, and specifications.

<SwmSnippet path="/grails-app/views/product/product_options.gsp" line="1">

---

## Managing Product Options

The <SwmPath>[grails-app/views/product/product_options.gsp](grails-app/views/product/product_options.gsp)</SwmPath> file provides a view for managing product options, allowing users to add, order, and edit options for a specific product. It includes links for adding new options, ordering existing ones, and navigating back to the product page.

```groovy server pages
<%@ page import="org.greenfield.Product" %>
<%@ page import="org.greenfield.ApplicationService" %>
<% def applicationService = grailsApplication.classLoader.loadClass('org.greenfield.ApplicationService').newInstance()%>


<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<div class="content">
		
			<h2>Product Options
				<g:link action="add_product_option" name="edit" class="btn btn-primary pull-right" id="${productInstance.id}" style="margin-left:10px;">Add Product Option</g:link>
				
				<g:link controller="productOption" action="manage_positions" name="edit" class="btn btn-default pull-right" id="${productInstance.id}" style="margin-left:10px;">Order Options</g:link>
				
```

---

</SwmSnippet>

## Adding New Product Options

The <SwmPath>[grails-app/views/product/add_product_option.gsp](grails-app/views/product/add_product_option.gsp)</SwmPath> file offers a form for adding new product options. This form typically includes fields for the option name and the associated product, enabling users to expand the available options for a product.

## Displaying Product Details

The <SwmPath>[grails-app/views/product/show.old](grails-app/views/product/show.old)</SwmPath> file displays detailed information about a product, including its name, price, quantity, and various attributes like catalogs, images, and specifications. This view helps users get a comprehensive overview of a product's details.

# Product View Endpoints

Product View Endpoints

<SwmSnippet path="/grails-app/views/product/details.gsp" line="1">

---

## details

The <SwmToken path="grails-app/views/product/details.gsp" pos="15:24:24" line-data="${raw(applicationService.getProductHeader(catalogInstance, productInstance, &quot;${productInstance?.name} Product Details&quot;, true, params))}">`Details`</SwmToken> endpoint renders the detailed view of a specific product. It uses the <SwmToken path="grails-app/views/product/details.gsp" pos="1:11:11" line-data="&lt;%@ page import=&quot;org.greenfield.ApplicationService&quot; %&gt;">`ApplicationService`</SwmToken> to fetch and display various product details such as the product header, breadcrumbs, images, and social media sharing options. The endpoint also includes a form for adding the product to the shopping cart.

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

The <SwmToken path="grails-app/views/product/search.gsp" pos="6:9:9" line-data="${raw(applicationService.getDefaultHeader(&quot;Search Results&quot;))}">`Search`</SwmToken> endpoint provides a view for displaying search results for products. It uses the <SwmToken path="grails-app/views/product/search.gsp" pos="1:11:11" line-data="&lt;%@ page import=&quot;org.greenfield.ApplicationService&quot; %&gt;">`ApplicationService`</SwmToken> to render the default header and footer, and displays a list of products matching the search query. The endpoint also includes pagination controls and handles cases where no search results are found.

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
