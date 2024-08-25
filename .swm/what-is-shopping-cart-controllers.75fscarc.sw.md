---
title: What is Shopping Cart Controllers
---
Controllers are responsible for handling incoming web requests and returning appropriate responses.

In the Shopping Cart, the <SwmToken path="grails-app/controllers/greenfield/ShoppingCartController.groovy" pos="49:2:2" line-data="class ShoppingCartController {">`ShoppingCartController`</SwmToken> manages various actions related to the shopping cart functionality.

It includes methods for adding items to the cart, removing items, viewing the cart, and proceeding to checkout.

The controller also handles both authenticated and anonymous user sessions, ensuring that shopping cart data is managed correctly for both types of users.

Security annotations are used to restrict access to certain actions based on user roles, such as <SwmToken path="grails-app/controllers/greenfield/ShoppingCartController.groovy" pos="59:6:6" line-data="	@Secured([&#39;ROLE_ADMIN&#39;])">`ROLE_ADMIN`</SwmToken> and <SwmToken path="grails-app/controllers/greenfield/ShoppingCartController.groovy" pos="73:6:6" line-data="	@Secured([&#39;ROLE_CUSTOMER&#39;,&#39;ROLE_ADMIN&#39;])">`ROLE_CUSTOMER`</SwmToken>.

The controller interacts with various services like <SwmToken path="grails-app/controllers/greenfield/ShoppingCartController.groovy" pos="53:3:3" line-data="	def emailService">`emailService`</SwmToken>, <SwmToken path="grails-app/controllers/greenfield/ShoppingCartController.groovy" pos="54:3:3" line-data="	def applicationService">`applicationService`</SwmToken>, <SwmToken path="grails-app/controllers/greenfield/ShoppingCartController.groovy" pos="55:3:3" line-data="	def currencyService">`currencyService`</SwmToken>, and <SwmToken path="grails-app/controllers/greenfield/ShoppingCartController.groovy" pos="56:3:3" line-data="	def springSecurityService">`springSecurityService`</SwmToken> to perform its tasks.

It also includes methods for calculating totals, adjusting inventory, and sending order confirmation emails.

<SwmSnippet path="/grails-app/controllers/greenfield/ShoppingCartController.groovy" line="48">

---

## <SwmToken path="grails-app/controllers/greenfield/ShoppingCartController.groovy" pos="49:2:2" line-data="class ShoppingCartController {">`ShoppingCartController`</SwmToken>

The <SwmToken path="grails-app/controllers/greenfield/ShoppingCartController.groovy" pos="49:2:2" line-data="class ShoppingCartController {">`ShoppingCartController`</SwmToken> manages various actions related to the shopping cart functionality. It includes methods for adding items to the cart, removing items, viewing the cart, and proceeding to checkout.

```groovy
@Mixin(BaseController)
class ShoppingCartController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def emailService
	def applicationService
	def currencyService
	def springSecurityService

```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/ShoppingCartController.groovy" line="59">

---

## Security Annotations

Security annotations like <SwmToken path="grails-app/controllers/greenfield/ShoppingCartController.groovy" pos="59:1:9" line-data="	@Secured([&#39;ROLE_ADMIN&#39;])">`@Secured(['ROLE_ADMIN'])`</SwmToken> are used to restrict access to certain actions based on user roles.

```groovy
	@Secured(['ROLE_ADMIN'])
	def active(){		
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/ShoppingCartController.groovy" line="80">

---

## Handling Authenticated and Anonymous Sessions

The controller handles both authenticated and anonymous user sessions, ensuring that shopping cart data is managed correctly for both types of users.

```groovy
    def index() {	
		if(springSecurityService.isLoggedIn()){
			
			def customerAccount = Account.findByUsername(principal?.username)
			//println  "is logged in... ${customerAccount}"
			
			def shoppingCartInstance = ShoppingCart.findByAccountAndStatus(customerAccount, ShoppingCartStatus.ACTIVE.description())
			
			if(shoppingCartInstance){
				def permission = customerAccount.permissions.find { 
					it.permission == ControllerConstants.SHOPPING_CART_PERMISSION + shoppingCartInstance.id
				}
			
				if(!permission){
					flash.message = "You do not have permission to access this shopping cart..."
					redirect(controller:'store', action:'index')
				}
			
				calculateShoppingCartSubtotal(shoppingCartInstance)
			}
			
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/ShoppingCartController.groovy" line="53">

---

## Interacting with Services

The controller interacts with various services like <SwmToken path="grails-app/controllers/greenfield/ShoppingCartController.groovy" pos="53:3:3" line-data="	def emailService">`emailService`</SwmToken>, <SwmToken path="grails-app/controllers/greenfield/ShoppingCartController.groovy" pos="54:3:3" line-data="	def applicationService">`applicationService`</SwmToken>, <SwmToken path="grails-app/controllers/greenfield/ShoppingCartController.groovy" pos="55:3:3" line-data="	def currencyService">`currencyService`</SwmToken>, and <SwmToken path="grails-app/controllers/greenfield/ShoppingCartController.groovy" pos="56:3:3" line-data="	def springSecurityService">`springSecurityService`</SwmToken> to perform its tasks.

```groovy
	def emailService
	def applicationService
	def currencyService
	def springSecurityService
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/ShoppingCartController.groovy" line="737">

---

## Calculating Totals and Adjusting Inventory

Methods like <SwmToken path="grails-app/controllers/greenfield/ShoppingCartController.groovy" pos="737:3:3" line-data="	def calculateShoppingCartSubtotal(shoppingCart){">`calculateShoppingCartSubtotal`</SwmToken> are used for calculating totals, adjusting inventory, and sending order confirmation emails.

```groovy
	def calculateShoppingCartSubtotal(shoppingCart){
		if(shoppingCart &&
			shoppingCart?.shoppingCartItems.size() > 0){
			shoppingCart.subtotal = calculateSubTotal(shoppingCart)
			shoppingCart.save(flush:true)
		}
	}
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBZ3JlZW5maWVsZC1lY29tbWVyY2UlM0ElM0FTd2ltbS1EZW1v" repo-name="greenfield-ecommerce" doc-type="overview"><sup>Powered by [Swimm](/)</sup></SwmMeta>
