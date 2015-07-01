Function.prototype.myBind = function(obj) {
  var fn = this
  return function() {
    return fn.apply(obj)
  }
}


var Thing = function() {
}


var Thing.prototype.doStuff = function() {
  console.log("this is " + this)
}

doStuff()
var cheese = "cheese"
doStuff.myBind(cheese)


doStuff()
