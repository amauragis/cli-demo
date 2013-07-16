cli-demo
========

A bad calculator demonstrating bison/flex.

Dependencies
------------
* bison
* flex
* gcc

Explanation of Files
-------------------

* functions.c: provides functions for calling from our new parser
* functions.h: headers for said functions
* parser.l: defines our character sequences for parsing
* yaccparse.y: Creates grammar definitions
