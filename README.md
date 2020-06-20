# Mendeley API R OAuth Authorization code Example #

This is a simple example of an application that consumes the [Mendeley](http://www.mendeley.com) API. It is modified from https://github.com/Mendeley/mendeley-api-r-example to use the OAuth Authorization code flow. For more information on the API, see the [developer portal](http://dev.mendeley.com).

## About the application ##

The application is a script that searches for a document by DOI, retrieves the number of Mendeley users that have read the document, and produces a barplot of the readers by academic status.

## Prerequisites ##

Register your client at the [developer portal](http://dev.mendeley.com).  This will give you a client ID and secret. Use the Redirect URL http://localhost:1410/

## How to run ##

1. Install [R](http://www.r-project.org/).
2. Install the dependencies declared at the top of the script.
3. Set the options for your client, e.g. `options("MENDELEY_CLIENT_ID"=8362,"MENDELEY_CLIENT_SECRET"="O0iIfk3S7xaU4jlf")`
4. Run the script

