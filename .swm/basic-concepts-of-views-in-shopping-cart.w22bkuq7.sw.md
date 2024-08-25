---
title: Basic Concepts of Views in Shopping Cart
---
Views in the Shopping Cart section are responsible for rendering the user interface related to shopping cart functionalities. These views are written in Groovy Server Pages (GSP) and are located in the <SwmPath>[grails-app/views/shoppingCart/](grails-app/views/shoppingCart/)</SwmPath> directory.

The <SwmPath>[grails-app/views/shoppingCart/show.gsp](grails-app/views/shoppingCart/show.gsp)</SwmPath> file displays the details of a specific shopping cart instance, including its status, date created, account information, shipping charges, and the items in the cart.

The <SwmPath>[grails-app/views/shoppingCart/list.gsp](grails-app/views/shoppingCart/list.gsp)</SwmPath> file provides a list view of all shopping cart instances, showing details such as ID, date created, account, and status. It also includes pagination for navigating through multiple shopping cart entries.

The <SwmPath>[grails-app/views/shoppingCart/index.gsp](grails-app/views/shoppingCart/index.gsp)</SwmPath> file serves as the main view for the shopping cart, displaying the items currently in the cart, their prices, quantities, and the total cost. It also includes options for removing items and proceeding to checkout.

The <SwmPath>[grails-app/views/shoppingCart/active.gsp](grails-app/views/shoppingCart/active.gsp)</SwmPath> file lists all active shopping carts, showing the date created and the products in each cart. This view is useful for monitoring ongoing shopping activities.

The <SwmPath>[grails-app/views/shoppingCart/\_form.gsp](grails-app/views/shoppingCart/_form.gsp)</SwmPath> file is a partial view used for rendering form elements related to the shopping cart, such as the status field. It is included in other views where form inputs are required.

The <SwmPath>[grails-app/views/shoppingCart/checkout.gsp](grails-app/views/shoppingCart/checkout.gsp)</SwmPath> file is displayed after a successful checkout, showing the order details, including the order number, items purchased, prices, quantities, and the total amount. It also displays the shipping address and contact information.

The <SwmPath>[grails-app/views/shoppingCart/checkout_preview.gsp](grails-app/views/shoppingCart/checkout_preview.gsp)</SwmPath> file provides a preview of the checkout process, including a form for entering shipping and billing information. It integrates with payment gateways like Stripe and Braintree for processing payments.

<SwmSnippet path="/grails-app/views/shoppingCart/show.gsp" line="1">

---

Shopping Cart Views The <SwmPath>[grails-app/views/shoppingCart/show.gsp](grails-app/views/shoppingCart/show.gsp)</SwmPath> file displays the details of a specific shopping cart instance, including its status, date created, account information, shipping charges, and the items in the cart.

```groovy server pages

<%@ page import="org.greenfield.ShoppingCart" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'shoppingCart.label', default: 'ShoppingCart')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/views/shoppingCart/list.gsp" line="1">

---

The <SwmPath>[grails-app/views/shoppingCart/list.gsp](grails-app/views/shoppingCart/list.gsp)</SwmPath> file provides a list view of all shopping cart instances, showing details such as ID, date created, account, and status. It also includes pagination for navigating through multiple shopping cart entries.

```groovy server pages

<%@ page import="org.greenfield.ShoppingCart" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'shoppingCart.label', default: 'ShoppingCart')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/views/shoppingCart/index.gsp" line="1">

---

The <SwmPath>[grails-app/views/shoppingCart/index.gsp](grails-app/views/shoppingCart/index.gsp)</SwmPath> file serves as the main view for the shopping cart, displaying the items currently in the cart, their prices, quantities, and the total cost. It also includes options for removing items and proceeding to checkout.

```groovy server pages
<%@ page import="org.greenfield.ApplicationService" %>
<% def applicationService = grailsApplication.classLoader.loadClass('org.greenfield.ApplicationService').newInstance()%>
<% def currencyService = grailsApplication.classLoader.loadClass('org.greenfield.CurrencyService').newInstance()%>

${raw(applicationService.getScreenHeader("Checkout Preview"))}

	<h2>Shopping Cart</h2>
	
	<g:if test="${flash.message}">
		<div class="alert alert-info" role="status">${flash.message}</div>
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/views/shoppingCart/active.gsp" line="1">

---

The <SwmPath>[grails-app/views/shoppingCart/active.gsp](grails-app/views/shoppingCart/active.gsp)</SwmPath> file lists all active shopping carts, showing the date created and the products in each cart. This view is useful for monitoring ongoing shopping activities.

```groovy server pages
<%@ page import="org.greenfield.ApplicationService" %>
<% def applicationService = grailsApplication.classLoader.loadClass('org.greenfield.ApplicationService').newInstance()
%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title>Greenfield : Active Shopping Carts</title>
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/views/shoppingCart/_form.gsp" line="1">

---

The <SwmPath>[grails-app/views/shoppingCart/\_form.gsp](grails-app/views/shoppingCart/_form.gsp)</SwmPath> file is a partial view used for rendering form elements related to the shopping cart, such as the status field. It is included in other views where form inputs are required.

```groovy server pages
<%@ page import="org.greenfield.ShoppingCart" %>



<div class="fieldcontain ${hasErrors(bean: shoppingCartInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="shoppingCart.status.label" default="Status" />
	</label>
	<g:textField class="form-control" style="width:120px;" name="status" value="${shoppingCartInstance?.status}"/>
</div>
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/views/shoppingCart/checkout.gsp" line="1">

---

The <SwmPath>[grails-app/views/shoppingCart/checkout.gsp](grails-app/views/shoppingCart/checkout.gsp)</SwmPath> file is displayed after a successful checkout, showing the order details, including the order number, items purchased, prices, quantities, and the total amount. It also displays the shipping address and contact information.

```groovy server pages
<%@ page import="org.greenfield.ApplicationService" %>
<% def applicationService = grailsApplication.classLoader.loadClass('org.greenfield.ApplicationService').newInstance()
%>
<% def currencyService = grailsApplication.classLoader.loadClass('org.greenfield.CurrencyService').newInstance()%>

${raw(applicationService.getScreenHeader("Checkout Success"))}

	<h4>Successfully Processed Order. Thank you!</h4>
	
	<h2>Order # : ${transaction.id}</h2>
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/views/shoppingCart/checkout_preview.gsp" line="1">

---

The <SwmPath>[grails-app/views/shoppingCart/checkout_preview.gsp](grails-app/views/shoppingCart/checkout_preview.gsp)</SwmPath> file provides a preview of the checkout process, including a form for entering shipping and billing information. It integrates with payment gateways like Stripe and Braintree for processing payments.

```groovy server pages
<%@ page import="org.greenfield.State" %>
<%@ page import="org.greenfield.Country %>
<%@ page import="grails.util.Environment" %>
<%@ page import="org.greenfield.ApplicationService" %>
<% def applicationService = grailsApplication.classLoader.loadClass('org.greenfield.ApplicationService').newInstance()%>
<% def currencyService = grailsApplication.classLoader.loadClass('org.greenfield.CurrencyService').newInstance()%>
	


${raw(applicationService.getScreenHeader("Checkout"))}
```

---

</SwmSnippet>

# Shopping Cart Endpoints

Shopping Cart Endpoints

<SwmSnippet path="/grails-app/views/shoppingCart/index.gsp" line="71">

---

## <SwmToken path="grails-app/views/shoppingCart/index.gsp" pos="71:15:15" line-data="							&lt;g:form controller=&quot;shoppingCart&quot; action=&quot;remove_item&quot; method=&quot;get&quot; id=&quot;${shoppingCartInstance.id}&quot;&gt;">`remove_item`</SwmToken>

The <SwmToken path="grails-app/views/shoppingCart/index.gsp" pos="71:15:15" line-data="							&lt;g:form controller=&quot;shoppingCart&quot; action=&quot;remove_item&quot; method=&quot;get&quot; id=&quot;${shoppingCartInstance.id}&quot;&gt;">`remove_item`</SwmToken> endpoint is used to remove an item from the shopping cart. It is accessed via a form submission with the item ID and shopping cart ID as parameters.

```groovy server pages
							<g:form controller="shoppingCart" action="remove_item" method="get" id="${shoppingCartInstance.id}">
								<input type="hidden" name="itemId" value="${item.id}"/>
								<input type="hidden" name="id" value="${shoppingCartInstance.id}"/>
								<input type="submit" class="btn btn-sm btn-default" name="submit" value="Remove Item"/>
							</g:form>
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/views/shoppingCart/index.gsp" line="88">

---

## <SwmToken path="grails-app/views/shoppingCart/index.gsp" pos="88:15:15" line-data="			&lt;g:form controller=&quot;shoppingCart&quot; action=&quot;checkout_preview&quot; id=&quot;${shoppingCartInstance?.id}&quot;&gt;">`checkout_preview`</SwmToken>

The <SwmToken path="grails-app/views/shoppingCart/index.gsp" pos="88:15:15" line-data="			&lt;g:form controller=&quot;shoppingCart&quot; action=&quot;checkout_preview&quot; id=&quot;${shoppingCartInstance?.id}&quot;&gt;">`checkout_preview`</SwmToken> endpoint is used to proceed to the checkout preview page. It is accessed via a form submission with the shopping cart ID as a parameter.

```groovy server pages
			<g:form controller="shoppingCart" action="checkout_preview" id="${shoppingCartInstance?.id}">
				<input type="hidden" name="id" value="${shoppingCartInstance?.id}"/> 
				<g:submitButton name="submit"  value="Continue Checkout" class="btn btn-primary pull-right bt-lg" id="checkout-btn"/>
			</g:form>
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBZ3JlZW5maWVsZC1lY29tbWVyY2UlM0ElM0FTd2ltbS1EZW1v" repo-name="greenfield-ecommerce" doc-type="overview"><sup>Powered by [Swimm](/)</sup></SwmMeta>
