---
title: Overview of Configuration Views
---
Configuration Views are responsible for rendering the user interface for various configuration settings in the application.

These views include settings for store information, email configurations, payment gateways, shipping options, and more.

The <SwmPath>[grails-app/views/configuration/settings.gsp](grails-app/views/configuration/settings.gsp)</SwmPath> file provides the interface for store settings, allowing users to input details like company name, phone number, email, tax rate, and other store-specific information.

The <SwmPath>[grails-app/views/admin/index.gsp](grails-app/views/admin/index.gsp)</SwmPath> file offers options for importing and exporting data, managing uploads, and generating development data.

The <SwmPath>[grails-app/views/configuration/import_products_view.gsp](grails-app/views/configuration/import_products_view.gsp)</SwmPath> file facilitates the import of product data through a CSV file, detailing the required format and fields.

The <SwmPath>[grails-app/views/configuration/select_gateway.gsp](grails-app/views/configuration/select_gateway.gsp)</SwmPath> file allows users to select and configure payment gateways such as Stripe or Braintree, ensuring the application can process payments.

<SwmSnippet path="/grails-app/views/configuration/settings.gsp" line="1">

---

Store Settings The <SwmPath>[grails-app/views/configuration/settings.gsp](grails-app/views/configuration/settings.gsp)</SwmPath> file provides the interface for store settings, allowing users to input details like company name, phone number, email, tax rate, and other store-specific information.

```groovy server pages
<%@ page import="org.greenfield.Catalog" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="admin">
	<g:set var="entityName" value="${message(code: 'catalog.label', default: 'Catalog')}" />
	<title>Greenfield : Settings</title>
	<link rel="stylesheet" href="${resource(dir:'js/lib/ckeditor/4.4.0', file:'contents.css')}" />	
	<script type="text/javascript" src="${resource(dir:'js/lib/ckeditor/4.4.0/ckeditor.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js/lib/ckeditor/4.4.0/styles.js')}"></script>

	<style type="text/css">
		.section{
			margin:10px 20px 30px 0px;
		}
	</style>
	
	<link rel="stylesheet" href="${resource(dir:'css', file:'admin.css')}" />
	
</head>
<body>
```

---

</SwmSnippet>

Data Management The <SwmPath>[grails-app/views/admin/index.gsp](grails-app/views/admin/index.gsp)</SwmPath> file offers options for importing and exporting data, managing uploads, and generating development data.

Product Import The <SwmPath>[grails-app/views/configuration/import_products_view.gsp](grails-app/views/configuration/import_products_view.gsp)</SwmPath> file facilitates the import of product data through a CSV file, detailing the required format and fields.

Payment Gateways The <SwmPath>[grails-app/views/configuration/select_gateway.gsp](grails-app/views/configuration/select_gateway.gsp)</SwmPath> file allows users to select and configure payment gateways such as Stripe or Braintree, ensuring the application can process payments.

# Configuration Views Endpoints

Configuration Views Endpoints

<SwmSnippet path="/grails-app/views/configuration/settings.gsp" line="39">

---

## <SwmToken path="grails-app/views/configuration/settings.gsp" pos="39:7:7" line-data="	&lt;form action=&quot;save_settings&quot; class=&quot;form-horizontal&quot; method=&quot;post&quot;&gt;">`save_settings`</SwmToken>

The <SwmToken path="grails-app/views/configuration/settings.gsp" pos="39:7:7" line-data="	&lt;form action=&quot;save_settings&quot; class=&quot;form-horizontal&quot; method=&quot;post&quot;&gt;">`save_settings`</SwmToken> endpoint is used to save the store settings. This form action is triggered when the user submits the store settings form, which includes fields like company name, phone number, email, tax rate, and other store-specific information.

```groovy server pages
	<form action="save_settings" class="form-horizontal" method="post">
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/views/configuration/payment_settings.gsp" line="48">

---

## <SwmToken path="grails-app/views/configuration/payment_settings.gsp" pos="48:7:7" line-data="	&lt;form action=&quot;save_payment_settings&quot; class=&quot;form-horizontal&quot;&gt;">`save_payment_settings`</SwmToken>

The <SwmToken path="grails-app/views/configuration/payment_settings.gsp" pos="48:7:7" line-data="	&lt;form action=&quot;save_payment_settings&quot; class=&quot;form-horizontal&quot;&gt;">`save_payment_settings`</SwmToken> endpoint is used to save the payment settings. This form action is triggered when the user submits the payment settings form, which includes fields for configuring payment gateways such as Stripe or Braintree.

```groovy server pages
	<form action="save_payment_settings" class="form-horizontal">
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBZ3JlZW5maWVsZC1lY29tbWVyY2UlM0ElM0FTd2ltbS1EZW1v" repo-name="greenfield-ecommerce" doc-type="overview"><sup>Powered by [Swimm](/)</sup></SwmMeta>
