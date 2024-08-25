---
title: 'What is Catalog Controller '
---
The Catalog Controller is responsible for managing the catalog-related operations in the application.

It handles actions such as listing catalogs, showing catalog details, creating new catalogs, editing existing catalogs, and deleting catalogs.

The controller ensures that only authorized users, typically admins, can perform actions like creating, updating, and deleting catalogs.

It also manages the display of products within a catalog, including pagination and sorting of products.

The controller logs catalog views and tracks the number of views for each catalog.

It provides methods to handle catalog positions and generate catalog menus for administrative purposes.

<SwmSnippet path="/grails-app/controllers/greenfield/CatalogController.groovy" line="208">

---

## Listing Catalogs

The `list` method is used to list all catalogs, sorted by their position in ascending order. This method is secured to be accessed only by admins.

```groovy
    def list(Integer max) {
		authenticatedAdmin { adminAccount -> 
			
			def catalogInstanceList = Catalog.list([sort: "position", order: "asc"])
			def catalogsList = []
			
			catalogInstanceList.each { catalog ->
				def catalogData = [:]
				def catalogPath = ""
				if(catalog.parentCatalog){
					catalogPath = getFullCatalogPath(catalog)
				}else{
					catalogPath = "Top Level"
				}
				
				catalogData.id = catalog.id
				catalogData.path = catalogPath
				catalogData.name = catalog.name
				catalogData.position = catalog.position
				catalogData.productsCount = getCatalogProductsCount(catalog)
				catalogsList.add(catalogData)
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/CatalogController.groovy" line="277">

---

## Showing Catalog Details

The <SwmToken path="grails-app/controllers/greenfield/CatalogController.groovy" pos="277:3:3" line-data="    def show(Long id) {">`show`</SwmToken> method displays the details of a specific catalog. It is also secured for admin access.

```groovy
    def show(Long id) {
		authenticatedAdminCatalog { adminAccount, catalogInstance ->	
			
			def layouts = Layout.list()
			
			numberSpaces = 1
			def catalogOptions = getCatalogOptionsWithCatalog(catalogInstance)
			
    	    [ catalogInstance: catalogInstance, catalogOptions: catalogOptions, layouts: layouts ]			
		}
    }
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/CatalogController.groovy" line="261">

---

## Creating New Catalogs

The <SwmToken path="grails-app/controllers/greenfield/CatalogController.groovy" pos="261:3:3" line-data="    def create() {">`create`</SwmToken> method is used to create a new catalog. This method is secured to ensure only admins can create catalogs.

```groovy
    def create() {
		authenticatedAdmin { adminAccount -> 
			
			def layouts = Layout.list()
			
			numberSpaces = 1
			def catalogOptions = getCatalogOptions()
			
	    	[ catalogInstance: new Catalog(params), catalogOptions: catalogOptions, layouts: layouts ]
    	}
	}
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/CatalogController.groovy" line="293">

---

## Editing Existing Catalogs

The <SwmToken path="grails-app/controllers/greenfield/CatalogController.groovy" pos="293:3:3" line-data="    def edit(Long id) {">`edit`</SwmToken> method allows admins to edit the details of an existing catalog.

```groovy
    def edit(Long id) {
		authenticatedAdminCatalog { adminAccount, catalogInstance ->	
			
			def layouts = Layout.list()
			
			numberSpaces = 1
			def catalogOptions = getCatalogOptionsWithCatalog(catalogInstance)
			
            def c = Specification.createCriteria()
            def specifications = c.list {
                catalogs {
                    idEq(catalogInstance.id)
                }
            }
    	    [ catalogInstance: catalogInstance, catalogOptions: catalogOptions, specifications: specifications, layouts: layouts ]
		}
    }
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/CatalogController.groovy" line="398">

---

## Deleting Catalogs

The <SwmToken path="grails-app/controllers/greenfield/CatalogController.groovy" pos="398:3:3" line-data="    def delete(Long id) {">`delete`</SwmToken> method is used to delete a catalog. It ensures that the catalog is not associated with any products or subcatalogs before deletion.

```groovy
    def delete(Long id) {
		authenticatedAdminCatalog { adminAccount, catalogInstance ->
    	    try {
				CatalogViewLog.executeUpdate("delete CatalogViewLog c where c.catalog = :catalog", [catalog : catalogInstance])
                
                //delete all specifications, specification options and product specifications
			    def specifications = Specification.createCriteria().list{
                    catalogs{
                        idEq(catalogInstance.id)
                    }
                }
                
                specifications.each{ specification ->
                    specification.removeFromCatalogs(catalogInstance)
                    specification.save(flush:true)
                }
                
    	        catalogInstance.delete(flush: true)
    	        flash.message = "Successfully deleted the catalog"
    	        redirect(action: "list")
                
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/CatalogController.groovy" line="33">

---

## Displaying Products in a Catalog

The <SwmToken path="grails-app/controllers/greenfield/CatalogController.groovy" pos="33:3:3" line-data="	def products(Long id){">`products`</SwmToken> method manages the display of products within a catalog, including pagination and sorting. It also logs catalog views and tracks the number of views for each catalog.

```groovy
	def products(Long id){
		def catalogInstance = Catalog.findById(id)
		if(!catalogInstance){
			flash.message = "Catalog cannot be found"
			redirect(uri: '/',)	
			return
		}

		def max = 12
		def offset = params.offset ? params.offset : 0
		def sort = params.sort ? params.sort : "name"
		//def desc = 
		
		if(!catalogInstance){	
			flash.message = "Unable to find Catalog..."
			redirect(controller : 'store', action : 'index')
		}
		
		def products
		def productsTotal

```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/CatalogController.groovy" line="429">

---

## Handling Catalog Positions

The <SwmToken path="grails-app/controllers/greenfield/CatalogController.groovy" pos="429:3:3" line-data="    def manage_positions(Long id){">`manage_positions`</SwmToken> method allows admins to manage the positions of catalogs.

```groovy
    def manage_positions(Long id){
		authenticatedAdminCatalog { adminAccount, catalogInstance ->
			def catalogs = []
			if(catalogInstance.toplevel){
				catalogs = Catalog.findAllByToplevel(true)
			}else{
				def parentCatalog = catalogInstance.parentCatalog
				catalogs = parentCatalog.subcatalogs
				catalogs.sort{ it.position }
			}
			[ catalogInstance: catalogInstance, catalogs: catalogs ]
		}
    }
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/CatalogController.groovy" line="476">

---

## Generating Catalog Menus

The <SwmToken path="grails-app/controllers/greenfield/CatalogController.groovy" pos="476:3:3" line-data="	def menu_view(){">`menu_view`</SwmToken> method generates catalog menus for administrative purposes.

```groovy
	def menu_view(){
		def catalogMenuString = "<ul class=\"admin-catalog-menu\">"
		def toplevelCatalogs = Catalog.findAllByToplevel(true)
		toplevelCatalogs.each{ catalog ->
			def count = getCatalogProductsCount(catalog)
			catalogMenuString += "<li>${catalog.name}"
			catalogMenuString += "<span class=\"catalog-admin-links\">"
			catalogMenuString += "(<a href=\"/${applicationService.getContextName()}/catalog/manage_positions/${catalog.id}\">Update Position</a>"
			catalogMenuString += "&nbsp;|&nbsp;"
			catalogMenuString += "<a href=\"/${applicationService.getContextName()}/catalog/edit/${catalog.id}\">Edit</a>)"
			catalogMenuString += "&nbsp;&nbsp;&nbsp;&nbsp;${count} products</span>"
			if(catalog.subcatalogs){
				def subcatalogMenuString = getAllSubcatalogLists(catalog)
				catalogMenuString += subcatalogMenuString
			}
			catalogMenuString += "</li>"
		}
		catalogMenuString += "</ul>"
		
		[ catalogMenuString : catalogMenuString ]
	}
```

---

</SwmSnippet>

# Main functions

Main functions

<SwmSnippet path="/grails-app/controllers/greenfield/CatalogController.groovy" line="33">

---

## products

The <SwmToken path="grails-app/controllers/greenfield/CatalogController.groovy" pos="33:3:3" line-data="	def products(Long id){">`products`</SwmToken> function retrieves and displays products within a specific catalog. It handles pagination, sorting, and filtering of products. If the catalog is not found, it redirects to the home page.

```groovy
	def products(Long id){
		def catalogInstance = Catalog.findById(id)
		if(!catalogInstance){
			flash.message = "Catalog cannot be found"
			redirect(uri: '/',)	
			return
		}

		def max = 12
		def offset = params.offset ? params.offset : 0
		def sort = params.sort ? params.sort : "name"
		//def desc = 
		
		if(!catalogInstance){	
			flash.message = "Unable to find Catalog..."
			redirect(controller : 'store', action : 'index')
		}
		
		def products
		def productsTotal

```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/CatalogController.groovy" line="208">

---

## list

The `list` function displays a list of all catalogs, sorted by position. It is accessible only to admin users and prepares data for the catalog list view.

```groovy
    def list(Integer max) {
		authenticatedAdmin { adminAccount -> 
			
			def catalogInstanceList = Catalog.list([sort: "position", order: "asc"])
			def catalogsList = []
			
			catalogInstanceList.each { catalog ->
				def catalogData = [:]
				def catalogPath = ""
				if(catalog.parentCatalog){
					catalogPath = getFullCatalogPath(catalog)
				}else{
					catalogPath = "Top Level"
				}
				
				catalogData.id = catalog.id
				catalogData.path = catalogPath
				catalogData.name = catalog.name
				catalogData.position = catalog.position
				catalogData.productsCount = getCatalogProductsCount(catalog)
				catalogsList.add(catalogData)
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/CatalogController.groovy" line="261">

---

## create

The <SwmToken path="grails-app/controllers/greenfield/CatalogController.groovy" pos="261:3:3" line-data="    def create() {">`create`</SwmToken> function prepares the necessary data for creating a new catalog. It is accessible only to admin users and provides options for catalog layouts and parent catalogs.

```groovy
    def create() {
		authenticatedAdmin { adminAccount -> 
			
			def layouts = Layout.list()
			
			numberSpaces = 1
			def catalogOptions = getCatalogOptions()
			
	    	[ catalogInstance: new Catalog(params), catalogOptions: catalogOptions, layouts: layouts ]
    	}
	}
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/CatalogController.groovy" line="277">

---

## show

The <SwmToken path="grails-app/controllers/greenfield/CatalogController.groovy" pos="277:3:3" line-data="    def show(Long id) {">`show`</SwmToken> function displays the details of a specific catalog. It is accessible only to admin users and prepares data for the catalog detail view.

```groovy
    def show(Long id) {
		authenticatedAdminCatalog { adminAccount, catalogInstance ->	
			
			def layouts = Layout.list()
			
			numberSpaces = 1
			def catalogOptions = getCatalogOptionsWithCatalog(catalogInstance)
			
    	    [ catalogInstance: catalogInstance, catalogOptions: catalogOptions, layouts: layouts ]			
		}
    }
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/CatalogController.groovy" line="293">

---

## edit

The <SwmToken path="grails-app/controllers/greenfield/CatalogController.groovy" pos="293:3:3" line-data="    def edit(Long id) {">`edit`</SwmToken> function prepares the necessary data for editing an existing catalog. It is accessible only to admin users and provides options for catalog layouts and specifications.

```groovy
    def edit(Long id) {
		authenticatedAdminCatalog { adminAccount, catalogInstance ->	
			
			def layouts = Layout.list()
			
			numberSpaces = 1
			def catalogOptions = getCatalogOptionsWithCatalog(catalogInstance)
			
            def c = Specification.createCriteria()
            def specifications = c.list {
                catalogs {
                    idEq(catalogInstance.id)
                }
            }
    	    [ catalogInstance: catalogInstance, catalogOptions: catalogOptions, specifications: specifications, layouts: layouts ]
		}
    }
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/CatalogController.groovy" line="313">

---

## save

The <SwmToken path="grails-app/controllers/greenfield/CatalogController.groovy" pos="313:3:3" line-data="    def save() {">`save`</SwmToken> function handles the creation of a new catalog. It validates the input data, saves the catalog, and redirects to the catalog detail view upon success.

```groovy
    def save() {
		authenticatedAdmin { adminAccount ->
    	    
			def catalogInstance = new Catalog(params)
			
			def parentCatalog
			if(params.location){
				catalogInstance.toplevel = false
				parentCatalog = Catalog.get(params.location)
				if(!parentCatalog){
					flash.message = "Something went wrong while saving the Catalog.  Please try again.  Be sure to select a valid location"
    	        	render(view: "create", model: [catalogInstance: catalogInstance])
    	        	return
				}
			}else{
				catalogInstance.toplevel = true
			}
			
    	    if (!catalogInstance.save(flush: true)) {
				flash.error = "Something went wrong while saving catalog. Please try again."
    	        render(view: "create", model: [catalogInstance: catalogInstance])
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/CatalogController.groovy" line="355">

---

## update

The <SwmToken path="grails-app/controllers/greenfield/CatalogController.groovy" pos="355:3:3" line-data="    def update(Long id, Long version) {">`update`</SwmToken> function handles the updating of an existing catalog. It validates the input data, saves the changes, and redirects to the catalog detail view upon success.

```groovy
    def update(Long id, Long version) {
		authenticatedAdminCatalog { adminAccount, catalogInstance ->	
    	
        	catalogInstance.properties = params
			
			def parentCatalog
			if(params.location){
				catalogInstance.toplevel = false
				parentCatalog = Catalog.get(params.location)
				if(!parentCatalog){
					flash.message = "Something went wrong while saving the Catalog.  Please try again.  Be sure to select a valid location"
    	        	render(view: "create", model: [catalogInstance: catalogInstance])
    	        	return
				}
				catalogInstance.parentCatalog = parentCatalog
				catalogInstance.save(flush:true)
				parentCatalog.addToSubcatalogs(catalogInstance)
				parentCatalog.save(flush:true)
			}else{
				catalogInstance.toplevel = true
				if(catalogInstance.parentCatalog){
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/CatalogController.groovy" line="398">

---

## delete

The <SwmToken path="grails-app/controllers/greenfield/CatalogController.groovy" pos="398:3:3" line-data="    def delete(Long id) {">`delete`</SwmToken> function handles the deletion of a catalog. It ensures that the catalog has no associated products or subcatalogs before deletion and provides appropriate feedback messages.

```groovy
    def delete(Long id) {
		authenticatedAdminCatalog { adminAccount, catalogInstance ->
    	    try {
				CatalogViewLog.executeUpdate("delete CatalogViewLog c where c.catalog = :catalog", [catalog : catalogInstance])
                
                //delete all specifications, specification options and product specifications
			    def specifications = Specification.createCriteria().list{
                    catalogs{
                        idEq(catalogInstance.id)
                    }
                }
                
                specifications.each{ specification ->
                    specification.removeFromCatalogs(catalogInstance)
                    specification.save(flush:true)
                }
                
    	        catalogInstance.delete(flush: true)
    	        flash.message = "Successfully deleted the catalog"
    	        redirect(action: "list")
                
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBZ3JlZW5maWVsZC1lY29tbWVyY2UlM0ElM0FTd2ltbS1EZW1v" repo-name="greenfield-ecommerce" doc-type="overview"><sup>Powered by [Swimm](https://app.swimm.io/)</sup></SwmMeta>
