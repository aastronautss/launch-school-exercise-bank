# Variable Scope

## What's My Value? (Part 1)

```
7
```

This is because `+=` does not mutate a variable.

## What's My Value? (Part 2)

```
7
```

The `a` variable outside the method is not accessible from within the method. The method declares a new variable named `a`. Even if this were the same `a`, the `+=` operator (which is really a method with some syntactical sugar) does not mutate a variable.

## What's My Values? (Part 3)

```
7
```

As stated above, `a` from line 1 is not accessible from within the method. Therefore, line 4 is assigning a new variable named `a` to the value for `b`.

## What's My Value? (Part 4)

```
Xy-zy
```

In this case, we're passing a reference to the string assigned to `a` in line 1 to `my_value`. `[]=` is a method which mutates the caller.

## What's My Value? (Part 5)

```
Xyzzy
```

In this case, line 4 is a variable assignment, which does not mutate any variables. We're simply changing the refferent of `b` to a new string.

## What's My Value? (Part 6)

This will throw a `NameError` at line 4, since we're trying to reference a variable that is not accessible to the method.

## What's My Value? (Part 7)

```
3
```

Blocks work differently from methods, in that they have access to outer scope. For this reason, the same `a` as we declared on line 1 is being reassigned to different values as the block gets passed to `each`.

## What's My Value? (Part 8)

This will throw a `NameError` at line 7, since variables declared within a block are not accessible to their outer scope.

## What's My Value? (Part 9)

```
7
```

`a` is being shadowed on line 4, and so the assignment on line 5 is being acted on a completely different variable from the one we declare on line 1.

## What's My Value? (Part 10)

This will throw at line 6, since we're trying to call a method (namely `+=`) on an object that hasn't been defined.
