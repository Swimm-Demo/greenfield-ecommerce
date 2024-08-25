---
title: Gradle Configuration and Usage
---
# Intro

This document explains how Gradle is used in the Greenfield eCommerce project. It will cover the configuration and usage of Gradle in various files.

<SwmSnippet path="/settings.gradle" line="1">

---

# Project Name Configuration

The <SwmPath>[settings.gradle](settings.gradle)</SwmPath> file sets the root project name to 'greenfield'. This is essential for identifying the project in a multi-project build.

```gradle
rootProject.name='greenfield'
```

---

</SwmSnippet>

<SwmSnippet path="/build.gradle" line="1">

---

# Buildscript Configuration

The <SwmPath>[build.gradle](build.gradle)</SwmPath> file starts with the <SwmToken path="build.gradle" pos="1:0:0" line-data="buildscript {">`buildscript`</SwmToken> block, which defines the repositories and dependencies required for the build script itself. It includes the Grails Gradle plugin and Hibernate plugin.

```gradle
buildscript {
    repositories {
        mavenLocal()
        maven { url "https://repo.grails.org/grails/core" }
    }
    dependencies {
        classpath "org.grails:grails-gradle-plugin:$grailsVersion"
        classpath "org.grails.plugins:hibernate5:${gormVersion-".RELEASE"}"
//        classpath "com.bertramlabs.plugins:asset-pipeline-gradle:2.15.1"
    }
}
```

---

</SwmSnippet>

<SwmSnippet path="/build.gradle" line="13">

---

# Project Metadata

The project version is set to <SwmToken path="build.gradle" pos="13:3:5" line-data="version &quot;0.1&quot;">`0.1`</SwmToken> and the group is set to 'greenfield'. This metadata is used for publishing and dependency management.

```gradle
version "0.1"
group "greenfield"
```

---

</SwmSnippet>

<SwmSnippet path="/build.gradle" line="16">

---

# Applying Plugins

Several plugins are applied, including Eclipse, IDEA, WAR, Grails Web, and Grails GSP. These plugins add various tasks and configurations to the build.

```gradle
apply plugin:"eclipse"
apply plugin:"idea"
apply plugin:"war"
apply plugin:"org.grails.grails-web"
//apply plugin:"asset-pipeline"
apply plugin:"org.grails.grails-gsp"
```

---

</SwmSnippet>

<SwmSnippet path="/build.gradle" line="23">

---

# Repositories Configuration

The <SwmToken path="build.gradle" pos="23:0:0" line-data="repositories {">`repositories`</SwmToken> block specifies where to find the project's dependencies. It includes the local Maven repository and the Grails core repository.

```gradle
repositories {
    mavenLocal()
    maven { url "https://repo.grails.org/grails/core" }
```

---

</SwmSnippet>

<SwmSnippet path="/build.gradle" line="28">

---

# Dependencies Configuration

The <SwmToken path="build.gradle" pos="28:0:0" line-data="dependencies {">`dependencies`</SwmToken> block lists all the dependencies required for the project. This includes various libraries for mail, JSON processing, security, scheduling, and more. It also includes runtime and test dependencies.

```gradle
dependencies {
    /*** Greenfield specific ***/
    /** TODO: consider building each package and including in lib**/
    compile "javax.mail:mail:1.4"
    //compile "com.stripe:stripe-java:1.32.1"
    compile "com.google.code.gson:gson:2.3.1"
    compile 'org.grails.plugins:spring-security-shiro:3.1.1'
    compile "org.grails.plugins:quartz:2.0.12"
    //compile files("lib/easypost-java-2.1.2.jar")
    compile files("lib/easypost-api-client-3.4.0.jar")
    compile files("lib/stripe-java-4.9.0.jar")
    compile files("lib/braintree-java-2.89.0.jar")
	//compile files("lib/postgresql-42.1.1.jar")

    /*************************************************************/

    compile "org.springframework.boot:spring-boot-starter-logging"
    compile "org.springframework.boot:spring-boot-autoconfigure"
    compile "org.grails:grails-core"
    compile "org.springframework.boot:spring-boot-starter-actuator"
    compile "org.springframework.boot:spring-boot-starter-tomcat"
```

---

</SwmSnippet>

<SwmSnippet path="/build.gradle" line="77">

---

# <SwmToken path="build.gradle" pos="77:0:0" line-data="bootRun {">`bootRun`</SwmToken> Configuration

The <SwmToken path="build.gradle" pos="77:0:0" line-data="bootRun {">`bootRun`</SwmToken> task is configured to always enable ANSI output and add resources. It also sets the active Spring profiles based on system properties.

```gradle
bootRun {
    jvmArgs('-Dspring.output.ansi.enabled=always')
    addResources = true
    String springProfilesActive = 'spring.profiles.active'
    systemProperty springProfilesActive, System.getProperty(springProfilesActive)
}
```

---

</SwmSnippet>

<SwmSnippet path="/build.gradle" line="90">

---

# Custom String Method

A custom method <SwmToken path="build.gradle" pos="90:4:4" line-data="String.metaClass.uncapitalize = {">`uncapitalize`</SwmToken> is added to the <SwmToken path="build.gradle" pos="90:0:0" line-data="String.metaClass.uncapitalize = {">`String`</SwmToken> class using Groovy's <SwmToken path="build.gradle" pos="90:2:2" line-data="String.metaClass.uncapitalize = {">`metaClass`</SwmToken>. This method converts the first character of a string to lowercase.

```gradle
String.metaClass.uncapitalize = {
    if (delegate.length() <= 1) return delegate.toLowerCase()
    return delegate[0].toLowerCase() + delegate[1..-1]
}
```

---

</SwmSnippet>

<SwmSnippet path="/gradle/wrapper/gradle-wrapper.properties" line="2">

---

# Gradle Wrapper Properties

The <SwmPath>[gradle/wrapper/gradle-wrapper.properties](gradle/wrapper/gradle-wrapper.properties)</SwmPath> file configures the Gradle wrapper. It sets the distribution base and path, zip store base and path, and the URL for the Gradle distribution.

```ini
distributionBase=GRADLE_USER_HOME
distributionPath=wrapper/dists
zipStoreBase=GRADLE_USER_HOME
zipStorePath=wrapper/dists
distributionUrl=https\://services.gradle.org/distributions/gradle-3.5-bin.zip
```

---

</SwmSnippet>

<SwmSnippet path="/gradlew.bat" line="1">

---

# Gradle Wrapper Script for Windows

The <SwmPath>[gradlew.bat](gradlew.bat)</SwmPath> script is a Windows batch file for running the Gradle wrapper. It sets up the environment, finds the Java executable, and runs the Gradle wrapper with the specified arguments.

```batchfile
@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  Gradle startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

@rem Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

```

---

</SwmSnippet>

<SwmSnippet path="/gradlew" line="1">

---

# Gradle Wrapper Script for Unix

The <SwmPath>[gradlew](gradlew)</SwmPath> script is a Unix shell script for running the Gradle wrapper. It sets up the environment, finds the Java executable, and runs the Gradle wrapper with the specified arguments.

```
#!/usr/bin/env bash

##############################################################################
##
##  Gradle start up script for UN*X
##
##############################################################################

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS=""

APP_NAME="Gradle"
APP_BASE_NAME=`basename "$0"`

# Use the maximum available, or set MAX_FD != -1 to use that value.
MAX_FD="maximum"

warn ( ) {
    echo "$*"
}

```

---

</SwmSnippet>

&nbsp;

*This is an auto-generated document by Swimm AI 🌊 and has not yet been verified by a human*

<SwmMeta version="3.0.0" repo-id="Z2l0aHViJTNBJTNBZ3JlZW5maWVsZC1lY29tbWVyY2UlM0ElM0FTd2ltbS1EZW1v" repo-name="greenfield-ecommerce" doc-type="general-build-tool"><sup>Powered by [Swimm](https://app.swimm.io/)</sup></SwmMeta>
