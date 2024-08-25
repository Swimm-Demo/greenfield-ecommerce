---
title: Catalog Overview
---
Catalog refers to the collection of products and subcategories within the eCommerce application. It is a hierarchical structure that allows products to be organized in a meaningful way.

The <SwmToken path="grails-app/controllers/greenfield/CatalogController.groovy" pos="18:2:2" line-data="class CatalogController {">`CatalogController`</SwmToken> manages the CRUD operations for catalogs, including creating, updating, and deleting catalog entries. It also handles the display of products within a catalog and supports pagination and sorting of products.

The <SwmToken path="grails-app/controllers/greenfield/CatalogController.groovy" pos="9:6:6" line-data="import org.greenfield.Catalog">`Catalog`</SwmToken> domain class defines the properties and relationships of a catalog, such as its name, description, layout, and parent-child relationships with other catalogs. It also includes constraints and mappings to ensure data integrity and proper sorting.

The views associated with catalogs, such as <SwmPath>[grails-app/views/catalog/products.gsp](grails-app/views/catalog/products.gsp)</SwmPath> and <SwmPath>[grails-app/views/catalog/list.gsp](grails-app/views/catalog/list.gsp)</SwmPath>, provide the user interface for displaying catalog information and managing catalogs. These views use Groovy Server Pages (GSP) to render HTML content dynamically based on the catalog data.

<SwmSnippet path="/grails-app/controllers/greenfield/CatalogController.groovy" line="9">

---

<SwmToken path="grails-app/controllers/greenfield/CatalogController.groovy" pos="18:2:2" line-data="class CatalogController {">`CatalogController`</SwmToken> The <SwmToken path="grails-app/controllers/greenfield/CatalogController.groovy" pos="18:2:2" line-data="class CatalogController {">`CatalogController`</SwmToken> manages the CRUD operations for catalogs, including creating, updating, and deleting catalog entries. It also handles the display of products within a catalog and supports pagination and sorting of products.

```groovy
import org.greenfield.Catalog
import org.greenfield.Product
import org.greenfield.Specification
import org.greenfield.Layout

import grails.plugin.springsecurity.annotation.Secured


@Mixin(BaseController)
class CatalogController {

	def numberSpaces = 1
	def applicationService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]


    @Secured(['ROLE_ADMIN'])
    def index() {
        redirect(action: "list", params: params)
    }
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/domain/org/greenfield/Catalog.groovy" line="3">

---

Catalog Domain Class The <SwmToken path="grails-app/domain/org/greenfield/Catalog.groovy" pos="3:2:2" line-data="class Catalog {">`Catalog`</SwmToken> domain class defines the properties and relationships of a catalog, such as its name, description, layout, and parent-child relationships with other catalogs. It also includes constraints and mappings to ensure data integrity and proper sorting.

```groovy
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

	static hasMany = [ subcatalogs: Catalog ]
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/views/catalog/menu_view.gsp" line="2">

---

Catalog Views The views associated with catalogs, such as <SwmPath>[grails-app/views/catalog/menu_view.gsp](grails-app/views/catalog/menu_view.gsp)</SwmPath>, provide the user interface for displaying catalog information and managing catalogs. These views use Groovy Server Pages (GSP) to render HTML content dynamically based on the catalog data.

```groovy server pages
<%@ page import="org.greenfield.Catalog" %>
<%@ page import="org.greenfield.ApplicationService" %>
<% def applicationService = grailsApplication.classLoader.loadClass('org.greenfield.ApplicationService').newInstance()
%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<title>Greenfield : Catalog Administration</title>
		<style type="text/css">
			#menu-view-container{
				padding:20px;
				background:#f8f8f8;
				border:solid 1px #ddd;
			}
			#menu-view-container ul li{
				list-style:none !important;
				padding:3px 0px;
			}
		</style>
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/views/catalog/create.gsp" line="1">

---

The <SwmPath>[grails-app/views/catalog/create.gsp](grails-app/views/catalog/create.gsp)</SwmPath> view allows users to create new catalog entries.

```groovy server pages
<%@ page import="org.greenfield.Catalog" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'catalog.label', default: 'Catalog')}" />
		<title>Create Catalog</title>
		<link rel="stylesheet" href="${resource(dir:'js/lib/ckeditor/4.4.0', file:'contents.css')}" />	
		<script type="text/javascript" src="${resource(dir:'js/lib/ckeditor/4.4.0/ckeditor.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js/lib/ckeditor/4.4.0/styles.js')}"></script>
	
		<link rel="stylesheet" href="${resource(dir:'css', file:'admin.css')}" />
	</head>
	<body>
		
		
		
		<div class="form-outer-container">
		
		
			<div class="form-container">
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/views/catalog/edit.gsp" line="1">

---

The <SwmPath>[grails-app/views/catalog/edit.gsp](grails-app/views/catalog/edit.gsp)</SwmPath> view allows users to edit existing catalog entries.

```groovy server pages
<%@ page import="org.greenfield.Catalog" %>
<%@ page import="org.greenfield.ApplicationService" %>
<% def applicationService = grailsApplication.classLoader.loadClass('org.greenfield.ApplicationService').newInstance()
%>

<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="admin">
	
	<title>Edit Catalog</title>
	<link rel="stylesheet" href="${resource(dir:'js/lib/ckeditor/4.4.0', file:'contents.css')}" />	
	<script type="text/javascript" src="${resource(dir:'js/lib/ckeditor/4.4.0/ckeditor.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js/lib/ckeditor/4.4.0/styles.js')}"></script>
	
	<link rel="stylesheet" href="${resource(dir:'css', file:'admin.css')}" />
</head>
<body>
	
	
	<div class="form-outer-container">
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/views/catalog/manage_positions.gsp" line="54">

---

The <SwmPath>[grails-app/views/catalog/manage_positions.gsp](grails-app/views/catalog/manage_positions.gsp)</SwmPath> view allows users to manage the positions of catalogs within the hierarchy.

```groovy server pages
				<p class="information secondary">Click, drag and drop catalog to desired positions.  Click "Update Catalog Positions" to save changes</p>
				
				<div class="clear" style="margin-top:20px;"></div>

				<g:if test="${flash.message}">
					<div class="alert alert-info" role="status">${flash.message}</div>
				</g:if>
				
				<g:form action="update_positions" method="post">
					
					<input type="hidden" name="positions" id="positions" value="">
					<input type="hidden" name="catalogId" value="${catalogInstance.id}">
					
					<ul id="catalogs">
						<g:each in="${catalogs}" var="catalog">
					  		<li data-id="${catalog.id}"><span class="order-number"></span>${catalog.name}</li>
						</g:each>
					</ul>
					
					<input type="submit" value="Update Catalog Positions" class="btn btn-primary" style="float:left; margin-left:30px;"/>
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/views/catalog/show.gsp" line="1">

---

The <SwmPath>[grails-app/views/catalog/show.gsp](grails-app/views/catalog/show.gsp)</SwmPath> view displays the details of a specific catalog.

```groovy server pages
<%@ page import="org.greenfield.Catalog" %>
<%@ page import="org.greenfield.ApplicationService" %>
<% def applicationService = grailsApplication.classLoader.loadClass('org.greenfield.ApplicationService').newInstance()
%>

<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="admin">
	
	<title>Show Catalog</title>
	
</head>
<body>
	
	
	
	<div class="form-outer-container">
		
		
		<div class="form-container">
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/views/catalog/list.gsp" line="2">

---

The <SwmPath>[grails-app/views/catalog/list.gsp](grails-app/views/catalog/list.gsp)</SwmPath> view provides a list of all catalogs and includes options to create new catalogs or view them in a menu format.

```groovy server pages
<%@ page import="org.greenfield.Catalog" %>
<%@ page import="org.greenfield.ApplicationService" %>
<% def applicationService = grailsApplication.classLoader.loadClass('org.greenfield.ApplicationService').newInstance()
%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<title>Greenfield : Catalogs</title>
	</head>
	<body>

		<div id="list-catalog" class="content scaffold-list" role="main">
			
			<h2 class="">Catalogs
				<g:link controller="catalog" action="create" class="btn btn-primary pull-right" >New Catalog</g:link>
				<g:link controller="catalog" action="menu_view" class="btn btn-default pull-right" style="display:inline-block;margin-right:5px">Menu View</g:link>
            	<g:link controller="specification" action="list" class="btn btn-default pull-right" style="margin-right:5px">Specifications</g:link>
            </h2>
			
```

---

</SwmSnippet>

# Catalog APIs

Catalog APIs

<SwmSnippet path="/grails-app/views/catalog/create.gsp" line="23">

---

## Create Catalog

The <SwmToken path="grails-app/views/catalog/create.gsp" pos="23:4:4" line-data="				&lt;h2&gt;Create Catalog">`Create`</SwmToken> endpoint allows users to create a new catalog. It provides a form where users can input the catalog's name, location, layout, and description. The form is submitted to the <SwmToken path="grails-app/controllers/greenfield/CatalogController.groovy" pos="23:8:8" line-data="    static allowedMethods = [save: &quot;POST&quot;, update: &quot;POST&quot;, delete: &quot;POST&quot;]">`save`</SwmToken> action to persist the new catalog.

```groovy server pages
				<h2>Create Catalog
					<g:link controller="catalog" action="list" class="btn btn-default pull-right">Back to Catalogs</g:link>
					<br class="clear"/>
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/views/catalog/list.gsp" line="17">

---

## List Catalogs

The `list` endpoint displays a list of all catalogs. It includes links to create a new catalog, view the menu, and manage specifications. The list view shows the name and product count for each catalog, with options to edit or update the catalog's position.

```groovy server pages
			<h2 class="">Catalogs
				<g:link controller="catalog" action="create" class="btn btn-primary pull-right" >New Catalog</g:link>
				<g:link controller="catalog" action="menu_view" class="btn btn-default pull-right" style="display:inline-block;margin-right:5px">Menu View</g:link>
            	<g:link controller="specification" action="list" class="btn btn-default pull-right" style="margin-right:5px">Specifications</g:link>
            </h2>
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBZ3JlZW5maWVsZC1lY29tbWVyY2UlM0ElM0FTd2ltbS1EZW1v" repo-name="greenfield-ecommerce" doc-type="overview"><sup>Powered by [Swimm](/)</sup></SwmMeta>
