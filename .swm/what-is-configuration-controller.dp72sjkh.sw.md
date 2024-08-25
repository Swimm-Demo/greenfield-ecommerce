---
title: What is Configuration Controller
---
The Configuration Controller is responsible for managing various settings of the eCommerce application.

It handles settings related to the store's general information, such as the store name, address, phone number, and email.

The controller also manages email settings, including SMTP configurations like the admin email, support email, username, password, host, port, and authentication details.

Payment settings are another critical aspect managed by the Configuration Controller, including configurations for Stripe and Braintree payment gateways.

Shipping settings are also handled by the controller, ensuring that all shipping-related configurations are properly managed.

The controller uses the <SwmPath>[src/main/webapp/settings/settings.properties](src/main/webapp/settings/settings.properties)</SwmPath> file to store and retrieve these configurations, ensuring that changes are persisted.

Security is enforced through the <SwmToken path="grails-app/controllers/greenfield/ConfigurationController.groovy" pos="105:1:9" line-data=" 	@Secured([&#39;ROLE_ADMIN&#39;])">`@Secured(['ROLE_ADMIN'])`</SwmToken> annotation, ensuring that only authenticated admin users can access and modify these settings.

<SwmSnippet path="/grails-app/controllers/greenfield/ConfigurationController.groovy" line="32">

---

## General Store Settings

The Configuration Controller manages settings related to the store's general information, such as the store name, address, phone number, and email.

```groovy
class ConfigurationController {

	def emailService
	def applicationService
	def currencyService
	
	private final String SETTINGS_FILE = "settings.properties"
	
	private final String STORE_PRIVATE_KEY = "store.key"
	
	private final String STORE_CURRENCY = "store.currency"
	private final String STORE_COUNTRY_CODE = "store.country.code"
	private final String STORE_NAME = "store.name"
	private final String STORE_ADDRESS1 = "store.address1"
	private final String STORE_ADDRESS2 = "store.address2"
	private final String STORE_CITY = "store.city"
	private final String STORE_COUNTRY = "store.country"
	private final String STORE_STATE = "store.state"
	private final String STORE_ZIP = "store.zip"
	private final String STORE_PHONE = "store.phone"
	private final String STORE_EMAIL = "store.email"
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/ConfigurationController.groovy" line="74">

---

## Email Settings

The controller manages email settings, including SMTP configurations like the admin email, support email, username, password, host, port, and authentication details.

```groovy
	private final String MAIL_ADMIN_EMAIL_ADDRESS = "mail.smtp.adminEmail"
	private final String MAIL_SUPPORT_EMAIL_ADDRESS = "mail.smtp.supportEmail"
	private final String MAIL_USERNAME = "mail.smtp.username"
	private final String MAIL_PASSWORD = "mail.smtp.password"
	private final String MAIL_HOST = "mail.smtp.host"
	private final String MAIL_PORT = "mail.smtp.port"
	private final String MAIL_STARTTLS = "mail.smtp.starttls.enabled"
	private final String MAIL_AUTH = "mail.smtp.auth"
	
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/ConfigurationController.groovy" line="83">

---

## Payment Settings

Payment settings are managed by the Configuration Controller, including configurations for Stripe and Braintree payment gateways.

```groovy
	private final String STRIPE_ENABLED_KEY = "stripe.enabled"
	private final String STRIPE_DEVELOPMENT_API_KEY = "stripe.development.apiKey"
	private final String STRIPE_DEVELOPMENT_PUBLISHABLE_KEY = "stripe.development.publishableKey"
	private final String STRIPE_PRODUCTION_API_KEY = "stripe.production.apiKey"
	private final String STRIPE_PRODUCTION_PUBLISHABLE_KEY = "stripe.production.publishableKey"
	
	private final String BRAINTREE_ENABLED = "braintree.enabled"
	private final String BRAINTREE_MERCHANT_ID = "braintree.merchantId"
	private final String BRAINTREE_PUBLIC_KEY = "braintree.publicKey"
	private final String BRAINTREE_PRIVATE_KEY = "braintree.privateKey"
	
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/ConfigurationController.groovy" line="94">

---

## Shipping Settings

Shipping settings are handled by the controller, ensuring that all shipping-related configurations are properly managed.

```groovy
	private final String EASYPOST_ENABLED = "easypost.enabled"
	private final String EASYPOST_TEST_API_KEY = "easypost.test.apiKey"
	private final String EASYPOST_LIVE_API_KEY = "easypost.live.apiKey"
	
	private final String EASYPOST_ADDRESS_EXCEPTION_STRING = "An error occured. Response code: 400 Response body"
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/ConfigurationController.groovy" line="105">

---

## Security

Security is enforced through the <SwmToken path="grails-app/controllers/greenfield/ConfigurationController.groovy" pos="105:1:9" line-data=" 	@Secured([&#39;ROLE_ADMIN&#39;])">`@Secured(['ROLE_ADMIN'])`</SwmToken> annotation, ensuring that only authenticated admin users can access and modify these settings.

```groovy
 	@Secured(['ROLE_ADMIN'])
    def index() {
		authenticatedAdmin{ adminAccount ->
		}
	}
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBZ3JlZW5maWVsZC1lY29tbWVyY2UlM0ElM0FTd2ltbS1EZW1v" repo-name="greenfield-ecommerce" doc-type="overview"><sup>Powered by [Swimm](/)</sup></SwmMeta>
