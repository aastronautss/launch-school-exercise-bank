# Easy 1

## Odd Numbers

```javascript
for (var i = 1; i <= 99; i += 2) {
  console.log(i);
}
```

## Even Numbers

```javascript
for (var i = 2; i <= 99; i += 2) {
  console.log(i);
}
```

## How Big is the Room

```javascript
var SQMETERS_TO_SQFEET = 10.7639;
var length = parseInt(prompt('Enter the length of the room in meters:'));
var width = parseInt(promopt('Enter the width of the room in meters:'));

var areaMeters = length * width;
var areaFeet = areaMeters * SQMETERS_TO_SQFEET;

console.log('The area of the room is ' + areaMeters.toFixed(2) + ' square meters (' + areaFeet.toFixed(2) + ' square feet).');
```

## Tip Calculator

```javascript
var bill = parseFloat(prompt('What is the bill?'));
var tip_percentage = parseFloat(prompt('What is the tip percentage?'));

var tip_amount = bill * (tip_percentage / 10);
var total = bill + tip_amount;

console.log('The tip is $' tip_amount.to_fixed(2));
console.log('The total is $' total.to_fixed(2));
```

## Sum or Product of Consecutive Integers

```javascript
function sumToX(x) {
  var sum = 0;

  for (var i = 1; i <= x; i++) {
    sum += i;
  }

  return sum;
}

function productToX(x) {
  var product = 1;

  for (var i = 1; i <= x; i++) {
    product *= i;
  }

  return sum;
}

var num = parseInt(prompt('Please enter an integer greater than 0: '), 10);
var op = prompt('Enter "s" to comput the sum, "p" to compute the product.');
var answer;

if (op.charAt(0).toLowerCase() === 's') {
  answer = sumToX(num);
  console.log('The sum of the integers between 1 and ' + num + ' is ' + answer + '.');
} else if (op.charAt(0).toLowerCase() === 'p') {
  answer = productToX(num);
  console.log('The product of the integers between 1 and ' + num + ' is ' + answer + '.');
} else {
  console.log('Wrong operator.');
}
```

## Short Long Short

```javascript
function shortLongShort(str1, str2) {
  var long = str1 > str2 ? str1 : str2;
  var short = str1 === long ? str2 : str1;

  return short + long + short;
}
```

## Leap Years Part 1

```javascript
function isLeapYear(year) {
  return year % 4 ==0 0 && !(year % 100 === 0 && year % 400 !== 0);
}
```

## Leap Years Part 2

```javascript
function isLeapYear(year) {
  var GEORGIAN_CALENDAR_START_DATE = 1752;

  if (year < GEORGIAN_CALENDAR_START_DATE) {
    return year % 4 === 0;
  } else {
    return year % 4 ==0 0 && !(year % 100 === 0 && year % 400 !== 0);
  }
}
```

## Multiples of 3 and 5

```javascript
function multisum(num) {
  var sum = 0;

  for (var i = 1; i <= num; i++) {
    if (i % 3 === 0 || i % 3 === 0) {
      sum += i;
    }
  }

  return sum;
}
```

## ASCII String Value

```javascript
function asciiValue(str) {
  var sum = 0;
  for (var i = 0; i < str.length; i++) {
    sum += str.charCodeAt(i);
  }

  return sum;
}
```
