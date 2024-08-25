---
title: Configuration Overview
---
Configuration refers to the setup and management of various settings that control the behavior and functionality of the application.

The <SwmToken path="grails-app/controllers/greenfield/ConfigurationController.groovy" pos="32:2:2" line-data="class ConfigurationController {">`ConfigurationController`</SwmToken> class is responsible for handling the configuration settings, including store details, email settings, payment settings, and shipping settings.

The <SwmPath>[grails-app/views/configuration/settings.gsp](grails-app/views/configuration/settings.gsp)</SwmPath> view provides the user interface for administrators to update store settings such as company name, phone number, email, tax rate, and meta information.

The configuration settings are stored in properties files and are accessed and modified through various methods in the <SwmToken path="grails-app/controllers/greenfield/ConfigurationController.groovy" pos="32:2:2" line-data="class ConfigurationController {">`ConfigurationController`</SwmToken>.

Security annotations like <SwmToken path="grails-app/controllers/greenfield/ConfigurationController.groovy" pos="105:1:9" line-data=" 	@Secured([&#39;ROLE_ADMIN&#39;])">`@Secured(['ROLE_ADMIN'])`</SwmToken> ensure that only users with administrative privileges can access and modify the configuration settings.

<SwmSnippet path="/grails-app/views/configuration/payment_settings.gsp" line="64">

---

## Configuration Settings

The <SwmPath>[grails-app/views/configuration/payment_settings.gsp](grails-app/views/configuration/payment_settings.gsp)</SwmPath> view provides the interface for administrators to manage payment-related configurations.

```groovy server pages
				<div class="form-label twohundred pull-left" style="display:inline-block">Current Configuration</div>
				
				<div class="pull-left" style="display:inline-block; width:500px; margin-left:20px;">
					<a href="http://www.stripe.com" alt="Visit Stripe : Payments API Gateway" style="border:none;text-decoration:none"><img src="${resource(dir:'images/app', file:'stripe-logo.png')}" style="height:20%; width:20%;outline:none"/></a>
		
					<p class="information secondary" style="margin-top:0px !important;">Stripe is a developer-friendly way to accept payments online.  To continue, you will need a Stripe account to accept payments with Greenfield. <a href="http://stripe.com" target="_blank">Visit Stripe</a>.</p>
				</div>
				<br class="clear">
			</div>
			
			<div class="form-row">
				<div class="form-label twohundred pull-left" style="display:inline-block">Base Currency</div>
								
				<div class="input-container pull-left" style="width:500px;">
					<select name="storeCurrency" class="form-control" style="width:423px;" id="currencySelectStripe">
						<option value="USD" <%=usd%>>$&nbsp;&nbsp;USD - United States</option>
						<option value="GBP" <%=gbp%>>£&nbsp;&nbsp;GBP - United Kingdom</option>
						<option value="NZD" <%=nzd%>>$&nbsp;&nbsp;NZD - New Zealand</option>
						<option value="CAD" <%=cad%>>C $&nbsp;&nbsp;CAD - Canada</option>
						<option value="EUR" <%=eur%>>€&nbsp;&nbsp;EUR - Germany, France, Netherlands, Ireland</option>
						<option value="HKD" <%=hkd%>>HK$ HKD - Hong Kong</option>
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/views/configuration/shipping_settings.gsp" line="261">

---

## Shipping Settings

The <SwmPath>[grails-app/views/configuration/shipping_settings.gsp](grails-app/views/configuration/shipping_settings.gsp)</SwmPath> view includes settings related to shipping, such as customs certification.

```groovy server pages
					<span class="information secondary">This takes the place of the signature on the physical customs form. This is how you indicate that the information you have provided is accurate.</span>
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/ConfigurationController.groovy" line="621">

---

## Configuration Controller

The <SwmToken path="grails-app/controllers/greenfield/ConfigurationController.groovy" pos="32:2:2" line-data="class ConfigurationController {">`ConfigurationController`</SwmToken> class handles the logic for updating and storing configuration settings, including security measures to ensure only administrators can make changes.

```groovy
				customs_certify = This is a boolean value (true, false) that takes the place of the signature on the physical customs form. This is how you indicate that the information you have provided is accurate.
				customs_signer = This is the name of the person who is certifying that the information provided on the customs form is accurate. Use a name of the person in your organization who is responsible for this.
				non_delivery_option = In case the shipment cannot be delivered, this option tells the carrier what you want to happen to the package. You can pass either: 'abandon', 'return'. The value defaults to 'return'. If you pass ‘abandon’, you will not receive the package back if it cannot be delivered.
				eel_pfc = When shipping outside the US, you need to provide either an Exemption and Exclusion Legend (EEL) code or a Proof of Filing Citation (PFC). Which you need is based on the value of the goods being shipped.
				
				
				prop.setProperty(CUSTOMS_CONTENTS_TYPE, customsContentType)
				prop.setProperty(CUSTOMS_CONTENTS_EXPLANATION, customsContentsExplanation)
				prop.setProperty(CUSTOMS_RESTRICTION_TYPE, customsRestrictionType)
				prop.setProperty(CUSTOMS_RESTRICTION_COMMENTS, customsRestrictionComments)
				prop.setProperty(CUSTOMS_CERTIFY, customsCertify)
				prop.setProperty(CUSTOMS_SIGNER, customsSigner)
				prop.setProperty(CUSTOMS_NON_DELIVERY_OPTION, customsNonDeliveryOption)
				prop.setProperty(CUSTOMS_EEL_PFC, customsEelPfc)
				
				**/
				
				
				def absolutePath = grailsApplication.mainContext.servletContext.getRealPath('settings')
				absolutePath = absolutePath.endsWith("/") ? absolutePath : absolutePath + "/"
				def filePath = absolutePath + SETTINGS_FILE
```

---

</SwmSnippet>

# Configuration Endpoints

Configuration Endpoints

<SwmSnippet path="/grails-app/views/configuration/settings.gsp" line="30">

---

## settings

The <SwmToken path="grails-app/views/configuration/settings.gsp" pos="31:20:20" line-data="		&lt;li class=&quot;active&quot;&gt;&lt;g:link uri=&quot;/configuration/settings&quot; class=&quot;btn btn-default&quot;&gt;Store Settings&lt;/g:link&gt;&lt;/li&gt;">`settings`</SwmToken> endpoint provides the user interface for administrators to update store settings such as company name, phone number, email, tax rate, and meta information. It is accessed via the URI <SwmPath>[src/main/webapp/settings/](src/main/webapp/settings/)</SwmPath>.

```groovy server pages
	<ul class="nav nav-tabs" style="margin-bottom:30px;">
		<li class="active"><g:link uri="/configuration/settings" class="btn btn-default">Store Settings</g:link></li>
		<li class="inactive"><g:link uri="/configuration/email_settings" class="btn btn-default">Email Settings</g:link></li>
		<li class="inactive"><g:link uri="/configuration/payment_settings" class="btn btn-default">Payment Settings</g:link></li>
		<li class="inactive"><g:link uri="/configuration/shipping_settings" class="btn btn-default">Shipping Settings</g:link></li>
	</ul>
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/views/configuration/settings.gsp" line="39">

---

## <SwmToken path="grails-app/views/configuration/settings.gsp" pos="39:7:7" line-data="	&lt;form action=&quot;save_settings&quot; class=&quot;form-horizontal&quot; method=&quot;post&quot;&gt;">`save_settings`</SwmToken>

The <SwmToken path="grails-app/views/configuration/settings.gsp" pos="39:7:7" line-data="	&lt;form action=&quot;save_settings&quot; class=&quot;form-horizontal&quot; method=&quot;post&quot;&gt;">`save_settings`</SwmToken> endpoint handles the form submission for saving store settings. The form action is set to <SwmToken path="grails-app/views/configuration/settings.gsp" pos="39:7:7" line-data="	&lt;form action=&quot;save_settings&quot; class=&quot;form-horizontal&quot; method=&quot;post&quot;&gt;">`save_settings`</SwmToken>, and it uses the POST method to submit the updated settings.

```groovy server pages
	<form action="save_settings" class="form-horizontal" method="post">
		
			
		<div class="form-row">
			<span class="form-label twohundred">Company Name
				<br/>
				<span class="information secondary">Important, required for page titles etc.</span>
			</span>
			<span class="input-container">
				<input type="text" class="form-control threehundred" name="storeName" value="${settings?.storeName}" style="width:370px;"/>
			</span>
			<br class="clear"/>
		</div>
		
			
		<div class="form-row">
			<span class="form-label twohundred">Phone
				<br/>
				<span class="information secondary">Used when creating shipping labels</span>
			</span>
			<span class="input-container">
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBZ3JlZW5maWVsZC1lY29tbWVyY2UlM0ElM0FTd2ltbS1EZW1v" repo-name="greenfield-ecommerce" doc-type="overview"><sup>Powered by [Swimm](/)</sup></SwmMeta>
