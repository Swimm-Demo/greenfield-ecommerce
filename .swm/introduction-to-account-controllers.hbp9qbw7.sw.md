---
title: Introduction to Account Controllers
---
Controllers in Accounts handle various user-related actions such as profile management, password resets, and registration.

They define methods for different HTTP requests, specifying which roles are allowed to access each method.

For example, the <SwmToken path="grails-app/controllers/greenfield/AccountController.groovy" pos="58:3:3" line-data="	def customer_profile(){">`customer_profile`</SwmToken> method retrieves and displays the profile of an authenticated user.

The <SwmToken path="grails-app/controllers/greenfield/AccountController.groovy" pos="67:3:3" line-data="	def customer_update(){">`customer_update`</SwmToken> method allows users to update their account information, including address details.

Controllers also manage password reset functionalities, including sending reset emails and confirming password changes.

Administrative functions are also handled by controllers, such as viewing account activity and managing user accounts.

They ensure that only users with the appropriate roles can perform certain actions, enhancing security.

<SwmSnippet path="/grails-app/controllers/greenfield/AccountController.groovy" line="57">

---

## Profile Management

The <SwmToken path="grails-app/controllers/greenfield/AccountController.groovy" pos="58:3:3" line-data="	def customer_profile(){">`customer_profile`</SwmToken> method retrieves and displays the profile of an authenticated user.

```groovy
	@Secured(['ROLE_CUSTOMER', 'ROLE_ADMIN'])
	def customer_profile(){
		authenticatedAccount { accountInstance ->
			[accountInstance : accountInstance, countries: Country.list()]
		}
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/AccountController.groovy" line="67">

---

## Account Updates

The <SwmToken path="grails-app/controllers/greenfield/AccountController.groovy" pos="67:3:3" line-data="	def customer_update(){">`customer_update`</SwmToken> method allows users to update their account information, including address details.

```groovy
	def customer_update(){

		authenticatedAccount { customerAccount ->
		
			def accountInstance = Account.get(params.id)
			
   			if (!accountInstance) {
   			    flash.message = "Account not found"
   			    redirect(action: "customer_profile")
   			    return
   			}
        	
			accountInstance.properties = params
			accountInstance.addressVerified = false

			def easypostEnabled = applicationService.getEasyPostEnabled()
			
			def shipmentApi 
			if(easypostEnabled == "true"){
				shipmentApi = new EasyPostShipmentApi(applicationService, currencyService)
			}
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/AccountController.groovy" line="126">

---

## Password Reset

Controllers manage password reset functionalities, including sending reset emails and confirming password changes.

```groovy
	def customer_send_reset_email(){
	
		if(params.email){

			def accountInstance = Account.findByEmail(params.email)
			
			if(accountInstance){
				
				def resetUUID = UUID.randomUUID()
				accountInstance.resetUUID = resetUUID
				accountInstance.save(flush:true)
				
				def url = request.getRequestURL()
				
				def split = url.toString().split("/${applicationService.getContextName()}/")
				def httpSection = split[0]
				def resetUrl = "${httpSection}/${applicationService.getContextName()}/account/customer_confirm_reset?"
				def params = "username=${accountInstance.username}&uuid=${resetUUID}"
				resetUrl+= params
				
				sendResetEmail(accountInstance, resetUrl)
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/AccountController.groovy" line="245">

---

## Administrative Functions

Administrative functions are handled by controllers, such as viewing account activity and managing user accounts.

```groovy
	def account_activity(Long id){
		authenticatedAdmin { adminAccount ->
			def accountInstance = Account.get(id)
        	if (!accountInstance) {
        	    flash.message = "Account not found"
        	    redirect(action: "admin_list")
        	    return
        	}   
			def productViewStats = getProductViewsStatistics(accountInstance)
			def pageViewStats = getPageViewStatistics(accountInstance)
			def catalogViewStats = getCatalogViewsStatistics(accountInstance)
			def searchQueryStats = getSearchQueryStatistics(accountInstance)

			[accountInstance: accountInstance, productViewStats: productViewStats, 
			pageViewStats: pageViewStats, catalogViewStats: catalogViewStats, 
			searchQueryStats: searchQueryStats]
		}
	}
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBZ3JlZW5maWVsZC1lY29tbWVyY2UlM0ElM0FTd2ltbS1EZW1v" repo-name="greenfield-ecommerce" doc-type="overview"><sup>Powered by [Swimm](/)</sup></SwmMeta>
