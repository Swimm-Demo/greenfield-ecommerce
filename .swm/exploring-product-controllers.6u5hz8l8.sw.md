---
title: Exploring Product Controllers
---
Product Controllers manage the various actions related to products, such as searching, viewing details, listing, and managing product options.

They handle both public and administrative functionalities, ensuring that users can search for products and view their details, while administrators can create, update, and delete products.

The <SwmToken path="grails-app/controllers/greenfield/ProductController.groovy" pos="41:3:3" line-data="	def search(){		">`search`</SwmToken> method allows users to search for products based on a query, logging the search and associating it with the user's account if they are logged in.

The <SwmToken path="grails-app/controllers/greenfield/ProductController.groovy" pos="80:3:3" line-data="	def details(Long id){    ">`details`</SwmToken> method retrieves and displays detailed information about a specific product, including its options and variants, and logs the product view.

Administrative methods such as `list`, <SwmToken path="grails-app/controllers/greenfield/ProductController.groovy" pos="210:3:3" line-data="    def create() {">`create`</SwmToken>, <SwmToken path="grails-app/controllers/greenfield/ProductController.groovy" pos="377:3:3" line-data="    def edit(Long id) {">`edit`</SwmToken>, <SwmToken path="grails-app/controllers/greenfield/ProductController.groovy" pos="442:3:3" line-data="    def update(Long id, Long version) {">`update`</SwmToken>, and <SwmToken path="grails-app/controllers/greenfield/ProductController.groovy" pos="565:3:3" line-data="    def delete(Long id) {">`delete`</SwmToken> are secured to ensure only users with the appropriate roles can perform these actions.

These methods also handle additional functionalities like managing product photos and options, ensuring that products are properly categorized and displayed.

<SwmSnippet path="/grails-app/controllers/greenfield/ProductController.groovy" line="40">

---

## Search Method

The <SwmToken path="grails-app/controllers/greenfield/ProductController.groovy" pos="41:3:3" line-data="	def search(){		">`search`</SwmToken> method allows users to search for products based on a query, logging the search and associating it with the user's account if they are logged in.

```groovy
 	@Secured(['permitAll'])
	def search(){		
		if(params.query && params.query.length() >= 4){
			def max = 12
			def offset = params.offset ? params.offset : 0
			
			def productNameCriteria = Product.createCriteria()
			def products = productNameCriteria.list(max: max, offset: offset, sort: "name", order: "desc"){
				or {
					ilike("name", "%${params.query}%")
					ilike("description", "%${params.query}%")
				}
			}
				
			def searchLog = new SearchLog()
			searchLog.query = params.query.toLowerCase()
			
			def accountInstance
			if(principal?.username){
				accountInstance = Account.findByUsername(principal?.username)
				searchLog.account = accountInstance
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/ProductController.groovy" line="79">

---

## Details Method

The <SwmToken path="grails-app/controllers/greenfield/ProductController.groovy" pos="80:3:3" line-data="	def details(Long id){    ">`details`</SwmToken> method retrieves and displays detailed information about a specific product, including its options and variants, and logs the product view.

```groovy
	@Secured(['permitAll'])
	def details(Long id){    
		def productInstance = Product.get(id)
        if (!productInstance) {
            flash.message = "Product not found..."
            redirect(controller: 'store', action: "index")
            return
        }
		
		def baseProductOptions = ProductOption.findAllByProduct(productInstance)
		def productOptions = []
		
		baseProductOptions.each(){ productOption ->
			
			def option = [:]
			option.id = productOption.id
			option.name = productOption.name
			
			def variants = Variant.findAllByProductOption(productOption)
			option.variants = variants
			
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/ProductController.groovy" line="138">

---

## List Method

The `list` method is secured to ensure only users with the appropriate roles can perform these actions.

```groovy
 	@Secured(['ROLE_ADMIN'])
    def list(Integer max) {
		authenticatedAdmin { adminAccount ->
			params.max = Math.min(max ?: 10, 100)
			params.sort = params.sort ? params.sort : "id"
			params.order = params.order ? params.order : "asc"
			
    		[productInstanceList: Product.list(params), productInstanceTotal: Product.count(), catalogCount: Catalog.count()]
		}
    }
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/ProductController.groovy" line="209">

---

## Create Method

The <SwmToken path="grails-app/controllers/greenfield/ProductController.groovy" pos="210:3:3" line-data="    def create() {">`create`</SwmToken> method is used by administrators to create new products.

```groovy
	@Secured(['ROLE_ADMIN'])
    def create() {
		authenticatedAdmin { adminAccount ->
			
			def layouts = Layout.list()
			
			if(Catalog.count() == 0){
				flash.message = "You must create at least one Catalog before creating Products"
				redirect(controller:'product', action: 'list')
				return
			}
			
			def productInstance = new Product(params)
			
			def catalogIdsArray = []
			if(productInstance?.catalogs){
				catalogIdsArray = productInstance?.catalogs.collect { it.id }
			}
			def catalogIdSelectionList = getCatalogIdSelectionList(catalogIdsArray)
			
			[ productInstance: productInstance, catalogIdSelectionList: catalogIdSelectionList, layouts: layouts ]
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/ProductController.groovy" line="376">

---

## Edit Method

The <SwmToken path="grails-app/controllers/greenfield/ProductController.groovy" pos="377:3:3" line-data="    def edit(Long id) {">`edit`</SwmToken> method is used by administrators to edit existing products.

```groovy
	@Secured(['ROLE_ADMIN'])
    def edit(Long id) {
		authenticatedAdminProduct { adminAccount, productInstance ->
			
			def layouts = Layout.list()
			
			if(Catalog.count() == 0){
				flash.error = "Product will not display in store front until Catalogs have been created and products have been added to Catalogs."
			}
			
			def catalogIdsArray = []
			if(productInstance?.catalogs){
				catalogIdsArray = productInstance?.catalogs.collect { it.id }
			}
			def catalogIdSelectionList = getCatalogIdSelectionList(catalogIdsArray)
    	    [ productInstance: productInstance, catalogIdsArray: catalogIdsArray, catalogIdSelectionList: catalogIdSelectionList, layouts: layouts ]
		}
    }
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/ProductController.groovy" line="441">

---

## Update Method

The <SwmToken path="grails-app/controllers/greenfield/ProductController.groovy" pos="442:3:3" line-data="    def update(Long id, Long version) {">`update`</SwmToken> method is used by administrators to update existing products.

```groovy
	@Secured(['ROLE_ADMIN'])
    def update(Long id, Long version) {
		authenticatedAdminProduct { adminAccount, productInstance ->
			
			try{

				def productCatalogIdsArray = []
				if(productInstance?.catalogs){
					productCatalogIdsArray = productInstance?.catalogs.collect { it.id }
				}
				def catalogIdSelectionList = getCatalogIdSelectionList(productCatalogIdsArray)
				
				
				if(!params.catalogIds){
					flash.error = "<strong>No Catalogs Defined</strong><br/> You must select a catalog in order to make the product visible from a catalog menu. <br/>Please specify at least <strong>1 catalog</strong> before continuing."
    	    	    render(view: "edit", model: [productInstance: productInstance, catalogIdSelectionList: catalogIdSelectionList ])
    	    	    return
				}
				
				def catalogIdsArray = params.catalogIds.split(',').collect{it as int}
				
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/ProductController.groovy" line="564">

---

## Delete Method

The <SwmToken path="grails-app/controllers/greenfield/ProductController.groovy" pos="565:3:3" line-data="    def delete(Long id) {">`delete`</SwmToken> method is used by administrators to delete products.

```groovy
	@Secured(['ROLE_ADMIN'])
    def delete(Long id) {
		authenticatedAdminProduct { adminAccount, productInstance ->
       		try {
				//Delete all ProductViewLogs
				ProductViewLog.executeUpdate("delete ProductViewLog p where p.product = :product", [product : productInstance])
                
                def productSpecifications = ProductSpecification.findAllByProduct(productInstance)
                productSpecifications.each { productSpecification ->
                    productInstance.removeFromProductSpecifications(productSpecification)
                    productSpecification.delete(flush:true)
                }
                
       		    productInstance.delete(flush: true)
       		    flash.message = "Successfull deleted product"
       		    redirect(action: "list")
       		}catch (DataIntegrityViolationException e) {
       		    flash.message = "Something went wrong when trying to delete.  The item you are trying to delete might exist in a Order or shopping cart.  Please try again or disable product"
       		    redirect(action: "edit", id: id)
        	}
		}
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBZ3JlZW5maWVsZC1lY29tbWVyY2UlM0ElM0FTd2ltbS1EZW1v" repo-name="greenfield-ecommerce" doc-type="overview"><sup>Powered by [Swimm](/)</sup></SwmMeta>
