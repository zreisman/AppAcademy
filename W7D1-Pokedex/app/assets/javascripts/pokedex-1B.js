Pokedex.RootView.prototype.renderPokemonDetail = function (pokemon) {
  var $div = $("<div>").addClass("detail");
  var $img = $("<img>").attr("src", pokemon.get("image_url"));
  $div.append($img);
  var $ul = $("<ul>");
  debugger

  _.each(pokemon.keys(), function(property) {

      var $li = $("<li>").text(property + ": " + pokemon.get(property));
      $ul.append($li);
    });
  $div.append($ul);
  this.$pokeDetail.html($div);
};

Pokedex.RootView.prototype.selectPokemonFromList = function (event) {
  // current target;

  var cid = $(event.target).data().pokemonId;
  var pokemon = this.pokes.get(cid);
  this.renderPokemonDetail(pokemon);
};
