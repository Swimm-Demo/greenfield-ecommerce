---
title: Layouts Overview
---
Layouts are entities that define the structure and appearance of different parts of the application. They include attributes such as <SwmToken path="grails-app/domain/org/greenfield/Layout.groovy" pos="11:3:3" line-data="	String name">`name`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Layout.groovy" pos="12:3:3" line-data="	String content">`content`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Layout.groovy" pos="13:3:3" line-data="	String css">`css`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Layout.groovy" pos="14:3:3" line-data="	String javascript">`javascript`</SwmToken>, and a flag to indicate if it is the default layout.

Layouts are managed through the <SwmToken path="grails-app/controllers/greenfield/LayoutController.groovy" pos="14:2:2" line-data="class LayoutController {">`LayoutController`</SwmToken>, which provides various actions for creating, editing, updating, and deleting layouts. The controller ensures that only users with the <SwmToken path="grails-app/controllers/greenfield/LayoutController.groovy" pos="28:6:6" line-data=" 	@Secured([&#39;ROLE_ADMIN&#39;])	">`ROLE_ADMIN`</SwmToken> role can perform these actions.

The <SwmToken path="grails-app/controllers/greenfield/LayoutController.groovy" pos="260:18:18" line-data="		File layoutFile = grailsApplication.mainContext.getResource(&quot;templates/storefront/layout-wrapper.html&quot;).file">`layout`</SwmToken> class includes constraints to ensure data integrity, such as making the <SwmToken path="grails-app/domain/org/greenfield/Layout.groovy" pos="11:3:3" line-data="	String name">`name`</SwmToken> attribute unique and mandatory, and setting size limits for <SwmToken path="grails-app/domain/org/greenfield/Layout.groovy" pos="12:3:3" line-data="	String content">`content`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Layout.groovy" pos="13:3:3" line-data="	String css">`css`</SwmToken>, and <SwmToken path="grails-app/domain/org/greenfield/Layout.groovy" pos="14:3:3" line-data="	String javascript">`javascript`</SwmToken> attributes.

Layouts can be applied to different parts of the application, such as checkout screens, registration screens, and other pages. This is managed through specific actions in the <SwmToken path="grails-app/controllers/greenfield/LayoutController.groovy" pos="14:2:2" line-data="class LayoutController {">`LayoutController`</SwmToken>.

The <SwmToken path="grails-app/controllers/greenfield/LayoutController.groovy" pos="14:2:2" line-data="class LayoutController {">`LayoutController`</SwmToken> also provides functionality to edit and update the base layout wrapper, which is stored in the <SwmPath>[src/main/webapp/templates/storefront/](src/main/webapp/templates/storefront/)</SwmPath> directory.

<SwmSnippet path="/grails-app/domain/org/greenfield/Layout.groovy" line="9">

---

## Layout Attributes

The <SwmToken path="grails-app/controllers/greenfield/LayoutController.groovy" pos="260:18:18" line-data="		File layoutFile = grailsApplication.mainContext.getResource(&quot;templates/storefront/layout-wrapper.html&quot;).file">`layout`</SwmToken> class includes attributes such as <SwmToken path="grails-app/domain/org/greenfield/Layout.groovy" pos="11:3:3" line-data="	String name">`name`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Layout.groovy" pos="12:3:3" line-data="	String content">`content`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Layout.groovy" pos="13:3:3" line-data="	String css">`css`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Layout.groovy" pos="14:3:3" line-data="	String javascript">`javascript`</SwmToken>, and a flag to indicate if it is the default layout.

```groovy
	String uuid
	
	String name
	String content
	String css
	String javascript
	boolean defaultLayout
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/domain/org/greenfield/Layout.groovy" line="24">

---

## Layout Constraints

The <SwmToken path="grails-app/controllers/greenfield/LayoutController.groovy" pos="260:18:18" line-data="		File layoutFile = grailsApplication.mainContext.getResource(&quot;templates/storefront/layout-wrapper.html&quot;).file">`layout`</SwmToken> class includes constraints to ensure data integrity, such as making the <SwmToken path="grails-app/domain/org/greenfield/Layout.groovy" pos="26:1:1" line-data="		name(nullable:false, unique:true)">`name`</SwmToken> attribute unique and mandatory, and setting size limits for <SwmToken path="grails-app/domain/org/greenfield/Layout.groovy" pos="27:1:1" line-data="		content(blank:false, nullable:false, size:0..65535)">`content`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Layout.groovy" pos="28:1:1" line-data="		css(blank:true, nullable:true, size:0..65535)">`css`</SwmToken>, and <SwmToken path="grails-app/domain/org/greenfield/Layout.groovy" pos="29:1:1" line-data="		javascript(blank:true, nullable:true, size:0..65535)">`javascript`</SwmToken> attributes.

```groovy
	static constraints = {
		uuid(nullable:true)
		name(nullable:false, unique:true)
		content(blank:false, nullable:false, size:0..65535)
		css(blank:true, nullable:true, size:0..65535)
		javascript(blank:true, nullable:true, size:0..65535)
		defaultLayout(nullable:false, default:false)
		id generator: 'sequence', params:[sequence:'ID_LAYOUT_PK_SEQ']
    }
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/LayoutController.groovy" line="14">

---

## Managing Layouts

The <SwmToken path="grails-app/controllers/greenfield/LayoutController.groovy" pos="14:2:2" line-data="class LayoutController {">`LayoutController`</SwmToken> provides various actions for creating, editing, updating, and deleting layouts. These actions are secured to ensure only users with the <SwmToken path="grails-app/controllers/greenfield/LayoutController.groovy" pos="28:6:6" line-data=" 	@Secured([&#39;ROLE_ADMIN&#39;])	">`ROLE_ADMIN`</SwmToken> role can perform them.

```groovy
class LayoutController {

	def applicationService
	//Grails 2 explicitly set
    //def grailsApplication
	private final String SETTINGS_FILE = "settings.properties"
	
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/LayoutController.groovy" line="357">

---

## Applying Layouts

Layouts can be applied to different parts of the application, such as checkout screens, registration screens, and other pages. This is managed through specific actions in the <SwmToken path="grails-app/controllers/greenfield/LayoutController.groovy" pos="14:2:2" line-data="class LayoutController {">`LayoutController`</SwmToken>.

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
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/controllers/greenfield/LayoutController.groovy" line="259">

---

## Editing Base Layout Wrapper

The <SwmToken path="grails-app/controllers/greenfield/LayoutController.groovy" pos="14:2:2" line-data="class LayoutController {">`LayoutController`</SwmToken> also provides functionality to edit and update the base layout wrapper, which is stored in the <SwmPath>[src/main/webapp/templates/storefront/](src/main/webapp/templates/storefront/)</SwmPath> directory.

```groovy
	def edit_wrapper(){
		File layoutFile = grailsApplication.mainContext.getResource("templates/storefront/layout-wrapper.html").file
		def layoutWrapper = layoutFile.text
		
		[layoutWrapper: layoutWrapper]
	}
```

---

</SwmSnippet>

# Layout Endpoints

Layout Endpoints

## <SwmToken path="grails-app/controllers/greenfield/LayoutController.groovy" pos="14:2:2" line-data="class LayoutController {">`LayoutController`</SwmToken> Endpoints

The <SwmToken path="grails-app/controllers/greenfield/LayoutController.groovy" pos="14:2:2" line-data="class LayoutController {">`LayoutController`</SwmToken> manages the endpoints related to layout operations. These endpoints allow for creating, editing, updating, and deleting layouts. Only users with the <SwmToken path="grails-app/controllers/greenfield/LayoutController.groovy" pos="28:6:6" line-data=" 	@Secured([&#39;ROLE_ADMIN&#39;])	">`ROLE_ADMIN`</SwmToken> role can access these endpoints. The controller ensures that the layout data is valid by enforcing constraints such as unique and mandatory <SwmToken path="grails-app/domain/org/greenfield/Layout.groovy" pos="11:3:3" line-data="	String name">`name`</SwmToken> attributes, and size limits for <SwmToken path="grails-app/domain/org/greenfield/Layout.groovy" pos="12:3:3" line-data="	String content">`content`</SwmToken>, <SwmToken path="grails-app/domain/org/greenfield/Layout.groovy" pos="13:3:3" line-data="	String css">`css`</SwmToken>, and <SwmToken path="grails-app/domain/org/greenfield/Layout.groovy" pos="14:3:3" line-data="	String javascript">`javascript`</SwmToken> attributes.

<SwmSnippet path="/grails-app/views/layouts/main.gsp" line="1">

---

### Example: Creating a Layout

This example shows how a layout is structured in the <SwmPath>[grails-app/views/layouts/main.gsp](grails-app/views/layouts/main.gsp)</SwmPath> file. The layout includes various elements such as meta tags, links, and scripts, which are essential for the layout's appearance and functionality.

```groovy server pages
<!DOCTYPE html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	
	<g:layoutHead/>
	
</head>
<body>

	<div class="container">
	
		<div class="row">
		
			<div class="span12">
			
				<div class="navbar navbar-default" role="navigation">
					<div class="navbar-header">
					
						<g:link controller="content" action="home" class="${home_active}" params="[activeLink: 'home']">Home</g:link>
						<g:link controller="content" action="about" class="${about_active}" params="[activeLink: 'about']">About</g:link>
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/views/layouts/admin.gsp" line="1">

---

### Example: Admin Layout

This example shows the <SwmPath>[grails-app/views/layouts/admin.gsp](grails-app/views/layouts/admin.gsp)</SwmPath> layout, which includes additional elements like navigation links and custom styles specific to the admin interface.

```groovy server pages
<%@ page import="grails.util.Environment" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<title><g:layoutTitle default="Greenfield : ${message(code: "administration")}" /></title>


	<link rel="stylesheet" href="${resource(dir:'bootstrap/3.1.1/css', file:'bootstrap.min.css')}" />
	<script type="text/javascript" src="${resource(dir:'js/lib/jquery/1.11.0/jquery.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'bootstrap/3.1.1/js/bootstrap.js')}"></script>
	<script type="text/javascript" src="${resource(dir:'js/lib/datepicker/datepicker.js')}"></script>
	
	<script type="text/javascript" src="${resource(dir:'js/lib/datepicker/bootstrap-datepicker.js')}"></script>
	<link rel="stylesheet" href="${resource(dir:'js/lib/datepicker', file:'datepicker.css')}" />
	
	<script type="text/javascript" src="${resource(dir:'js/lib/dygraphs/1.1.0/dygraph-combined.min.js')}"></script>
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBZ3JlZW5maWVsZC1lY29tbWVyY2UlM0ElM0FTd2ltbS1EZW1v" repo-name="greenfield-ecommerce" doc-type="overview"><sup>Powered by [Swimm](/)</sup></SwmMeta>
