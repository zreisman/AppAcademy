Pokedex.RootView.prototype.addPokemonToList = function (pokemon) {
  var $li = $('<li>').text(pokemon.get("name") + ', ' + pokemon.get("poke_type"));
  $li.addClass('poke-list-item');
  $li.attr("data-pokemon-id", pokemon.cid);
  this.$pokeList.append($li);
};

Pokedex.RootView.prototype.refreshPokemon = function () {
  var p = this.pokes;
  var that = this;
  p.fetch({
    success: function(collection, response) {   // collection and resp
      _.each(collection.models, that.addPokemonToList, that);
    }
  });
};
