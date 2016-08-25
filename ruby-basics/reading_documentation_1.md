# Reading Documentation 1

## Where to Find Documentation

We can find documentation at ruby-doc.org.

## `while` Loops

`https://ruby-doc.org/core-2.2.0/doc/syntax/control_expressions_rdoc.html#label-while+Loop`

## Return Value of `while`

In the link from the previous exercise:

"The result of a while loop is nil unless break is used to supply a value."

## Return Value of `break`

According to the section on `break` statements on the "control expressions" page, `break` will return the value of the expression that is passed to it. If no value is given, it'll return `nil`.

## Large Numbers

We can use the `_` caracter in the middle of a numeric literal. This lets us break a number into hundreds, thousands, etc. in order to make it easier to read.

## Symbol Syntax

`:tyler_guillen`

## Default Arguments in the Middle

Ruby will first fill the arguments without a default value, then it will fill the default values. This call will print:

```
[4, 5, 3, 6]
```

## String Class

`http://ruby-doc.org/core-2.3.1/String.html`

## Right Justifying Strings

`#rjust`

## Class and Instance Methods

`File::path` is a class method, which is called on the `File` class itself. `File#path` is an instance method, which we can call on an instance of `File`.
