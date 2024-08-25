---
title: Understanding Catalog Views
---
Catalog Views are responsible for displaying different aspects of the catalog data to the user. They provide various interfaces for interacting with catalog information.

The <SwmPath>[grails-app/views/catalog/list.gsp](grails-app/views/catalog/list.gsp)</SwmPath> file displays a list of catalogs, allowing users to create new catalogs, view the menu view, and manage catalog positions. It also shows the number of products in each catalog and provides options to edit or update catalog positions.

The <SwmPath>[grails-app/views/catalog/menu_view.gsp](grails-app/views/catalog/menu_view.gsp)</SwmPath> file shows how the catalog menu will appear on the storefront. It includes a styled container that displays the catalog menu structure and provides links to create new catalogs or return to the list view.

The <SwmPath>[grails-app/views/catalog/products.gsp](grails-app/views/catalog/products.gsp)</SwmPath> file displays the products within a specific catalog. It includes pagination, filtering options, and detailed product information such as name, image, and purchase options.

The <SwmPath>[grails-app/views/catalog/show.gsp](grails-app/views/catalog/show.gsp)</SwmPath> file provides a detailed view of a single catalog, including its name, description, URL, and layout. It also includes options to edit the catalog or return to the catalog list.

<SwmSnippet path="/grails-app/views/catalog/list.gsp" line="1">

---

List View The <SwmPath>[grails-app/views/catalog/list.gsp](grails-app/views/catalog/list.gsp)</SwmPath> file displays a list of catalogs, allowing users to create new catalogs, view the menu view, and manage catalog positions. It also shows the number of products in each catalog and provides options to edit or update catalog positions.

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

<SwmSnippet path="/grails-app/views/catalog/menu_view.gsp" line="1">

---

Menu View The <SwmPath>[grails-app/views/catalog/menu_view.gsp](grails-app/views/catalog/menu_view.gsp)</SwmPath> file shows how the catalog menu will appear on the storefront. It includes a styled container that displays the catalog menu structure and provides links to create new catalogs or return to the list view.

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
```

---

</SwmSnippet>

# Catalog Views APIs

Catalog Views APIs

<SwmSnippet path="/grails-app/views/catalog/list.gsp" line="1">

---

## list

The `list` endpoint displays a list of catalogs, allowing users to create new catalogs, view the menu view, and manage catalog positions. It also shows the number of products in each catalog and provides options to edit or update catalog positions.

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

<SwmSnippet path="/grails-app/views/catalog/menu_view.gsp" line="1">

---

## <SwmToken path="grails-app/views/catalog/list.gsp" pos="19:15:15" line-data="				&lt;g:link controller=&quot;catalog&quot; action=&quot;menu_view&quot; class=&quot;btn btn-default pull-right&quot; style=&quot;display:inline-block;margin-right:5px&quot;&gt;Menu View&lt;/g:link&gt;">`menu_view`</SwmToken>

The <SwmToken path="grails-app/views/catalog/list.gsp" pos="19:15:15" line-data="				&lt;g:link controller=&quot;catalog&quot; action=&quot;menu_view&quot; class=&quot;btn btn-default pull-right&quot; style=&quot;display:inline-block;margin-right:5px&quot;&gt;Menu View&lt;/g:link&gt;">`menu_view`</SwmToken> endpoint shows how the catalog menu will appear on the storefront. It includes a styled container that displays the catalog menu structure and provides links to create new catalogs or return to the list view.

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
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBZ3JlZW5maWVsZC1lY29tbWVyY2UlM0ElM0FTd2ltbS1EZW1v" repo-name="greenfield-ecommerce" doc-type="overview"><sup>Powered by [Swimm](/)</sup></SwmMeta>
