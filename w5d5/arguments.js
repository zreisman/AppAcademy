var logarguments = function() {
  for(var i = 0; i < arguments.length; i++) {
    console.log(arguments[i]);
  }
}

var sum = function() {
  var result = 0
  for (var i = 0; i < arguments.length; i++) {
    result += arguments[i]
  }
  return result
}


var myBind = function(obj) {
  this.apply(obj)  
}
console.log(sum(4,5,6,7,8))
