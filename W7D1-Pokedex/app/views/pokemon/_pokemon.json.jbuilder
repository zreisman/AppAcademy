json.extract! pokemon, :name, :attack, :defense, :poke_type, :moves, :image_url, :created_at, :updated_at

# building toys property for json object
# toys A/R relation for pokemon
if display_toys
  json.toys do
    json.array! pokemon.toys, partial: "toys/toy", as: :toy

  end
end


# json.pokemon do
#   json.name pokemon.name
#   json.attack pokemon.attack
#   json.defense pokemon.defense
#   json.poke_type pokemon.poke_type
#   json.moves pokemon.moves
#   json.image_url pokemon.image_url
#   json.created_at pokemon.created_at
#   json.updated_at pokemon.updated_at
# end
