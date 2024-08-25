---
title: Understanding Layout Controllers
---
Controllers are responsible for handling user requests and returning appropriate responses. They act as intermediaries between the view and the model, processing user input, interacting with the model, and determining the view to render.

In Layouts, controllers manage the creation, updating, and deletion of layout instances. They ensure that layout names are unique and contain necessary tags like \[\[CONTENT\]\].

Controllers also handle the application of layouts to various entities such as pages, products, and catalogs. They provide administrative functionalities to edit, update, and restore layout templates.

Security is enforced in controllers by restricting access to certain actions to users with the <SwmToken path="grails-app/controllers/greenfield/LayoutController.groovy" pos="28:6:6" line-data=" 	@Secured([&#39;ROLE_ADMIN&#39;])	">`ROLE_ADMIN`</SwmToken> role. This ensures that only authorized users can perform administrative tasks related to layouts.

<SwmSnippet path="/grails-app/controllers/greenfield/LayoutController.groovy" line="62">

---

## Managing Layout Instances

The <SwmToken path="grails-app/controllers/greenfield/LayoutController.groovy" pos="62:3:3" line-data="	def save(){">`save`</SwmToken> method in the <SwmToken path="grails-app/controllers/greenfield/LayoutController.groovy" pos="14:2:2" line-data="class LayoutController {">`LayoutController`</SwmToken> demonstrates how controllers manage the creation of layout instances. It ensures that layout names are unique and contain necessary tags like \[\[CONTENT\]\].

```groovy
	def save(){
		def layoutInstance = new Layout(params)
		println "content" + layoutInstance.content
		println "css" + layoutInstance.css
		println "javascript" + layoutInstance.javascript
		
		
		if(!layoutInstance.name){
			flash.message = "Please make sure layout name is not empty and is unique"
	        render(view: "create", model: [layoutInstance: layoutInstance])
	        return
		}
		
		def existingLayout = Layout.findByName(layoutInstance.name)
		if(existingLayout){
			flash.message = "Please make sure layout name is unique"
	        render(view: "create", model: [layoutInstance: layoutInstance])
	        return
		}
		
		
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/LayoutController.groovy" line="357">

---

## Applying Layouts

The <SwmToken path="grails-app/controllers/greenfield/LayoutController.groovy" pos="375:3:3" line-data="	def apply_products(){">`apply_products`</SwmToken> method shows how controllers handle the application of layouts to products. Similar methods exist for pages and catalogs.

```groovy
	def apply_pages(){
		def layout = Layout.get(params.id)
		if(!layout){
			flash.message = "Something went wrong, please try again"
			redirect(action:"list")
		}
		def pages = Page.list()
		pages.each(){ page ->
			page.layout = layout
			page.save(flush:true)
		}
		flash.message = "Successfully applied layout to all pages"
		redirect(action:"show", id: params.id)
	}

	
	
 	@Secured(['ROLE_ADMIN'])	
	def apply_products(){
		def layout = Layout.get(params.id)
		if(!layout){
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/LayoutController.groovy" line="28">

---

## Security Enforcement

The <SwmToken path="grails-app/controllers/greenfield/LayoutController.groovy" pos="28:1:9" line-data=" 	@Secured([&#39;ROLE_ADMIN&#39;])	">`@Secured(['ROLE_ADMIN'])`</SwmToken> annotation is used to restrict access to certain actions to users with the <SwmToken path="grails-app/controllers/greenfield/LayoutController.groovy" pos="28:6:6" line-data=" 	@Secured([&#39;ROLE_ADMIN&#39;])	">`ROLE_ADMIN`</SwmToken> role, ensuring that only authorized users can perform administrative tasks.

```groovy
 	@Secured(['ROLE_ADMIN'])	
	def how(){}
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBZ3JlZW5maWVsZC1lY29tbWVyY2UlM0ElM0FTd2ltbS1EZW1v" repo-name="greenfield-ecommerce" doc-type="overview"><sup>Powered by [Swimm](/)</sup></SwmMeta>
