Array.prototype.my_includes = function(x) {
  for (var i = 0; i < this.length; i++) {
    if (this[i] === x) {
      return true;
    }
  }
  return false;
}

Array.prototype.my_uniq = function() {
  var output = [];
  for (var i = 0; i < this.length; i++) {
    if (!output.my_includes(this[i])) {
      output.push(this[i]);
    }
  }
  return output;
}

Array.prototype.my_two_sum = function() {
  var output = [];
  for (var i = 0; i < this.length - 1; i++) {
    for (var j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        output.push([i, j]);
      }
    }
  }
  return output;
}

Array.prototype.my_transpose = function() {
  var output = [];
  for (var i = 0; i < this.length; i++) {
    var temp = [];
    for (var j = 0; j < this[i].length; j++) {
      temp.push(this[j][i]);
    }
    output.push(temp);
  }
  return output;
}

Array.prototype.myEach = function(other_function) {
  for(var i = 0; i < this.length; i++) {
    other_function(this[i]);
  }
  return this
}

var funky = function(n) {
  console.log(n * 2)
}

Array.prototype.myMap = function(user_function) {
  var new_array = [];
  // var mapping_function = function(element) {
  //    new_array.push(user_function(element))
  //  }
  //
  // //  this.myEach(mapping_function)
  this.myEach(function (element) { // other_function
    new_array.push(user_function(element));
  })
   return new_array
}
var result = [1, 2, 3].myMap(function (x) { // user_function
  return x * 2;
});


Array.prototype.myInject = function(user_function, accum) {
  if (accum) {
    var i = 0
  } else {
    accum = this[0];
    var i = 1
  }

  this.slice(i, this.length).myEach(function f(element) {
    accum = user_function(element, accum);
  });
  return accum;
};

function user_function(element, accum) {
  return element * accum;
}

var bubbleSort = function(array) {
  var swapped = true
  while (swapped === true) {
    swapped = false
    for(var i = 0; i < array.length - 1; i++) {
      if (array[i + 1] < array[i]) {
        var tmp = array[i];
        array[i] = array[i + 1];
        array[i + 1] = tmp;
        swapped = true
      }
    }
  }
  return array
}

function substrings(string) {
  var array = [];
  for (var i = 1; i <= string.length; i++) {
    for (var j = 0; j <= string.length - i; j++) {
      array.push(string.substring(j, j + i));
    }
  }

  return array.my_uniq();
}

// var result = [1, 2, 3].myInject(user_function);
// console.log(result);


console.log(substrings('cat'));






















//
