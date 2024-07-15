# Commonly Used HTTP Status Codes

This document provides a list of commonly used HTTP status codes and their meanings.

## 1xx Informational

- **100 Continue**: The server has received the initial part of the request and will continue to process it.

## 2xx success

- **200 OK**: The request has succeeded.
- **201 Created**: The request has been fulfilled and a new resource has been created.
- **204 No Content**: The server has successfully fulfilled the request, but there is no content to send back.

## 3xx Redirection

- **301 Moved Permanently**: The requested resource has been permanently moved to a new location.
- **302 Found**: The requested resource has been temporarily moved to a different location.
- **304 Not Modified**: The requested resource has not been modified since the last time it was accessed.

## 4xx Client Errors

- **400 Bad Request**: The server cannot process the request due to a client error.
- **401 Unauthorized**: The request requires user authentication.
- **404 Not Found**: The requested resource could not be found.

## 5xx Server Errors

- **500 Internal Server Error**: The server encountered an unexpected condition that prevented it from fulfilling the request.
- **503 Service Unavailable**: The server is currently unable to handle the request due to temporary overload or maintenance.

For a complete list of HTTP status codes, refer to the [HTTP Status Code Definitions](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml) documentation.