---
title: Basic concepts of Views in Layouts
---
Views in the `Layouts` directory are responsible for defining the structure and layout of different sections of the application. They use Groovy Server Pages (GSP) to dynamically generate HTML content.

The <SwmPath>[grails-app/views/layouts/dashboard.gsp](grails-app/views/layouts/dashboard.gsp)</SwmPath> file sets up the layout for the dashboard section, including importing necessary resources like stylesheets and scripts, and defining the structure of the dashboard page with various HTML elements and GSP tags.

The <SwmPath>[grails-app/views/layouts/main.gsp](grails-app/views/layouts/main.gsp)</SwmPath> file defines the main layout of the application, including the navigation bar, container, and footer. It uses GSP tags to include dynamic content and links to other parts of the application.

The <SwmPath>[grails-app/views/layouts/admin.gsp](grails-app/views/layouts/admin.gsp)</SwmPath> file is used for the administration section of the application. It includes styles, scripts, and HTML elements specific to the admin interface, and uses GSP tags to dynamically generate content based on the user's role and permissions.

Dashboard Layout The <SwmPath>[grails-app/views/layouts/dashboard.gsp](grails-app/views/layouts/dashboard.gsp)</SwmPath> file sets up the layout for the dashboard section, including importing necessary resources like stylesheets and scripts, and defining the structure of the dashboard page with various HTML elements and GSP tags.

Main Layout The <SwmPath>[grails-app/views/layouts/main.gsp](grails-app/views/layouts/main.gsp)</SwmPath> file defines the main layout of the application, including the navigation bar, container, and footer. It uses GSP tags to include dynamic content and links to other parts of the application.

Admin Layout The <SwmPath>[grails-app/views/layouts/admin.gsp](grails-app/views/layouts/admin.gsp)</SwmPath> file is used for the administration section of the application. It includes styles, scripts, and HTML elements specific to the admin interface, and uses GSP tags to dynamically generate content based on the user's role and permissions.

# Endpoints of Views

Endpoints of Views

<SwmSnippet path="/grails-app/views/layouts/main.gsp" line="20">

---

## Home

The <SwmToken path="grails-app/views/layouts/main.gsp" pos="20:15:15" line-data="						&lt;g:link controller=&quot;content&quot; action=&quot;home&quot; class=&quot;${home_active}&quot; params=&quot;[activeLink: &#39;home&#39;]&quot;&gt;Home&lt;/g:link&gt;">`home`</SwmToken> endpoint is defined using the <SwmToken path="grails-app/views/layouts/main.gsp" pos="20:2:4" line-data="						&lt;g:link controller=&quot;content&quot; action=&quot;home&quot; class=&quot;${home_active}&quot; params=&quot;[activeLink: &#39;home&#39;]&quot;&gt;Home&lt;/g:link&gt;">`g:link`</SwmToken> tag, which links to the <SwmToken path="grails-app/views/layouts/main.gsp" pos="20:15:15" line-data="						&lt;g:link controller=&quot;content&quot; action=&quot;home&quot; class=&quot;${home_active}&quot; params=&quot;[activeLink: &#39;home&#39;]&quot;&gt;Home&lt;/g:link&gt;">`home`</SwmToken> action of the <SwmToken path="grails-app/views/layouts/main.gsp" pos="20:9:9" line-data="						&lt;g:link controller=&quot;content&quot; action=&quot;home&quot; class=&quot;${home_active}&quot; params=&quot;[activeLink: &#39;home&#39;]&quot;&gt;Home&lt;/g:link&gt;">`content`</SwmToken> controller. This endpoint is used to navigate to the home page of the application.

```groovy server pages
						<g:link controller="content" action="home" class="${home_active}" params="[activeLink: 'home']">Home</g:link>
```

---

</SwmSnippet>

<SwmSnippet path="/grails-app/views/layouts/main.gsp" line="21">

---

## About

The <SwmToken path="grails-app/views/layouts/main.gsp" pos="21:15:15" line-data="						&lt;g:link controller=&quot;content&quot; action=&quot;about&quot; class=&quot;${about_active}&quot; params=&quot;[activeLink: &#39;about&#39;]&quot;&gt;About&lt;/g:link&gt;">`about`</SwmToken> endpoint is defined using the <SwmToken path="grails-app/views/layouts/main.gsp" pos="21:2:4" line-data="						&lt;g:link controller=&quot;content&quot; action=&quot;about&quot; class=&quot;${about_active}&quot; params=&quot;[activeLink: &#39;about&#39;]&quot;&gt;About&lt;/g:link&gt;">`g:link`</SwmToken> tag, which links to the <SwmToken path="grails-app/views/layouts/main.gsp" pos="21:15:15" line-data="						&lt;g:link controller=&quot;content&quot; action=&quot;about&quot; class=&quot;${about_active}&quot; params=&quot;[activeLink: &#39;about&#39;]&quot;&gt;About&lt;/g:link&gt;">`about`</SwmToken> action of the <SwmToken path="grails-app/views/layouts/main.gsp" pos="21:9:9" line-data="						&lt;g:link controller=&quot;content&quot; action=&quot;about&quot; class=&quot;${about_active}&quot; params=&quot;[activeLink: &#39;about&#39;]&quot;&gt;About&lt;/g:link&gt;">`content`</SwmToken> controller. This endpoint is used to navigate to the about page of the application.

```groovy server pages
						<g:link controller="content" action="about" class="${about_active}" params="[activeLink: 'about']">About</g:link>
```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBZ3JlZW5maWVsZC1lY29tbWVyY2UlM0ElM0FTd2ltbS1EZW1v" repo-name="greenfield-ecommerce" doc-type="overview"><sup>Powered by [Swimm](/)</sup></SwmMeta>
