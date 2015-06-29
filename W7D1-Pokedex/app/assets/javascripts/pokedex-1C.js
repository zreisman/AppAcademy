Pokedex.RootView.prototype.createPokemon = function (attrs, callback) {
  var pokemon = new Pokedex.Models.Pokemon();
  var that = this;
  pokemon.save(attrs, {
    success: function(model) {
      that.pokes.add(model);
      that.addPokemonToList(model);
      callback(model)
    }
  });


};

Pokedex.RootView.prototype.submitPokemonForm = function (event) {
  event.preventDefault();
  var $formData = $(event.currentTarget).serializeJSON();
  this.createPokemon($formData, this.renderPokemonDetail.bind(this));
};
