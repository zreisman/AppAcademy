
Function.prototype.myBind = function (obj) {
  var fn = this;
  return function () {
    return fn.apply(obj);
  };

};

var Cat = function (name) {
  this.name = name;
}

Cat.prototype.meow = function () {
  console.log(this.name + " says meow!");
};

var curie = new Cat("Curie")

curie.meow()
curie.meow()
curie.meow()
curie.meow()
curie.meow()
// setTimeout(curie.meow, 1000);
curie.meow.bind(curie)
// setTimeout(curie.meow.myBind(curie), 1000);
setTimeout(curie.meow(), 1000);

// var catmeows = curie.meow.myBind(curie)
//
// catmeows()
// catmeows()
// catmeows()
