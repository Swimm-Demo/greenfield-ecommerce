---
title: Getting started with Account Views
---
Views in Accounts are used to render the user interface for various account-related activities.

They include templates for displaying account information, such as account activity, order history, and profile details.

The <SwmPath>[grails-app/views/account/account_activity.gsp](grails-app/views/account/account_activity.gsp)</SwmPath> file, for example, displays the account's activity statistics, including products viewed, catalogs viewed, pages viewed, and searches performed.

These views use GSP (Groovy Server Pages) to dynamically generate HTML content based on the account data.

They also include links to other account-related actions, such as viewing detailed activity or navigating back to the account list.

<SwmSnippet path="/grails-app/views/account/admin_list.gsp" line="102">

---

## Account Activity View

The <SwmPath>[grails-app/views/account/admin_list.gsp](grails-app/views/account/admin_list.gsp)</SwmPath> file includes sortable columns for catalog views, product views, and page views, dynamically displaying the count of each type of view.

```groovy server pages
							<g:sortableColumn property="catalogViews" title="Catalog Views (${CatalogViewLog.count()})" params="${[admin:admin]}"/>

							<g:sortableColumn property="productViews" title="Product Views (${ProductViewLog.count()})" params="${[admin:admin]}"/>

							<g:sortableColumn property="pageViews" title="Page Views (${PageViewLog.count()})" params="${[admin:admin]}"/>						
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/views/account/customer_forgot.gsp" line="47">

---

## Password Reset Views

The <SwmPath>[grails-app/views/account/customer_forgot.gsp](grails-app/views/account/customer_forgot.gsp)</SwmPath> file provides instructions for the password reset process, informing users that an email will be sent with further instructions.

```groovy server pages
			<span class="small">An email will be sent to this address with instructions on how to continue reset process</span>
			<input type="email" value="" id="email" name="email" class="form-control" style="width:250px;"/>
		</div>
		
		<div class="form-group inactive">
			<em>Step Two : Verify Email</em><br/>
			<span class="small">An email will be sent to this address with instructions on how to continue reset process</span>
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/views/account/customer_send_reset_email.gsp" line="41">

---

The <SwmPath>[grails-app/views/account/customer_send_reset_email.gsp](grails-app/views/account/customer_send_reset_email.gsp)</SwmPath> file confirms that a reset password email has been successfully sent and instructs users to check their email for further steps.

```groovy server pages
					Successfully sent reset password email confirmation. Please check the email address entered for instructions on how to continue the password reset process.</span>
```

---

</SwmSnippet>

# Account Management APIs

Account Management APIs

<SwmSnippet path="/grails-app/views/account/admin_list.gsp" line="2">

---

## <SwmToken path="grails-app/views/account/admin_list.gsp" pos="38:9:9" line-data="					&lt;g:form action=&quot;admin_list&quot; class=&quot;form-horizontal&quot;&gt;">`admin_list`</SwmToken>

The <SwmToken path="grails-app/views/account/admin_list.gsp" pos="38:9:9" line-data="					&lt;g:form action=&quot;admin_list&quot; class=&quot;form-horizontal&quot;&gt;">`admin_list`</SwmToken> endpoint is used to display a list of accounts. It includes functionality to search for accounts by name, username, or email, and to filter between admin and customer accounts. The view also provides links to create new accounts and to navigate between different account types.

```groovy server pages
<%@ 
page import="org.greenfield.Account" 
page import="org.greenfield.log.CatalogViewLog"
page import="org.greenfield.log.ProductViewLog"
page import="org.greenfield.log.PageViewLog"
page import="org.greenfield.log.SearchLog"
page import="org.greenfield.Transaction"
%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}" />
		<title>Greenfield : Accounts</title>

		<style type="text/css">
			#newsletter-signups-link{
				text-align:right;
			}
		</style>
	</head>
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/views/account/admin_edit.gsp" line="1">

---

## <SwmToken path="grails-app/views/account/admin_list.gsp" pos="159:15:15" line-data="								&lt;g:link controller=&quot;account&quot; action=&quot;admin_edit&quot; params=&quot;[id: accountInstance.id]&quot; class=&quot;edit-${accountInstance.id}&quot; elementId=&quot;edit-${accountInstance.username}&quot;&gt;Edit&lt;/g:link&gt;&amp;nbsp;&amp;nbsp;">`admin_edit`</SwmToken>

The <SwmToken path="grails-app/views/account/admin_list.gsp" pos="159:15:15" line-data="								&lt;g:link controller=&quot;account&quot; action=&quot;admin_edit&quot; params=&quot;[id: accountInstance.id]&quot; class=&quot;edit-${accountInstance.id}&quot; elementId=&quot;edit-${accountInstance.username}&quot;&gt;Edit&lt;/g:link&gt;&amp;nbsp;&amp;nbsp;">`admin_edit`</SwmToken> endpoint is used to edit an existing account. It displays a form pre-filled with the account's current details, allowing the admin to update information such as username, email, address, and phone number. The view also includes links to navigate back to the account list or to view the account's activity.

```groovy server pages
<%@ page import="org.greenfield.Account" %>
<%@ page import="org.greenfield.common.RoleName" %>
<%@ page import="org.greenfield.State" %>
<% def applicationService = grailsApplication.classLoader.loadClass('org.greenfield.ApplicationService').newInstance()%>


<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}" />
		<title>Edit Account</title>

	</head>
	<body>


	<div class="form-outer-container">
	
	
		<div class="form-container">
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBZ3JlZW5maWVsZC1lY29tbWVyY2UlM0ElM0FTd2ltbS1EZW1v" repo-name="greenfield-ecommerce" doc-type="overview"><sup>Powered by [Swimm](/)</sup></SwmMeta>
