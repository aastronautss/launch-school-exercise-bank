// Ddaaiillyy ddoouubbllee

function crunch(string) {
  var new_string = '';
  for (var i = 0; i < string.length; i++) {
    var current_char = string.charAt(i).toLowerCase();
    var prev_char = string.charAt(i - 1).toLowerCase();

    if (current_char !== prev_char) {
      new_string += current_char;
    }
  }

  return new_string;
}

// Bannerizer

function repeatStr(string, numRepeats) {
  var output = '';
  for (var i = 0; i < numRepeats; i++) {
    output += string;
  }

  return output;
}

function logInBox(string) {
  var length = string.length
  console.log('+-' + repeatStr('-', length) + '-+');
  console.log('| ' + repeatStr(' ', length) + ' |');
  console.log('| ' + string + ' |');
  console.log('| ' + repeatStr(' ', length) + ' |');
  console.log('+-' + repeatStr('-', length) + '-+');
}

// Stringy Strings

function rotate(ary) {
  ary.push(ary.shift());
}

function stringy(num) {
  var values = ['1', '0']
  var output = ''

  for (; num > 0; num--) {
    output += values[0];
    rotate(values);
  }

  return output;
}

// Fibonacci Number Location by Length

function findFibIndexByLength(length) {

}

// Right Triangles

function triangle(height) {
  for (var row = 1; row <= height; row++) {
    console.log(' '.repeat(height - row) + '*'.repeat(row));
  }
}

// Madlibs

function madlibs() {
  var noun = prompt('Enter a noun:');
  var verb = prompt('Enter a verb:');
  var adjective = prompt('Enter an adjective:');
  var adverb = prompt('Enter an adverb:');

  var sentences = [
    'Do you ' + verb + ' your ' + adjective + ' ' + noun + ' ' + adverb + '? That\'s hilarious!',
    'The ' + adjective + ' ' + noun + ' ' + verb + 's ' + adverb + ' over the lazy dog.',
    'The ' + noun + ' ' + adverb + ' ' + verb + 's up ' + adjective + ' Joe\'s turtle.'
  ];

  console.log(sentences(Math.floor(Math.random() * sentences.length)))
}

// Double Doubles

