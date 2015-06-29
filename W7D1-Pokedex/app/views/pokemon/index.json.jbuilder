# @people = People.all
# => [ { "id": 1, "name": "David" }, { "id": 2, "name": "Jamie" } ]

json.array! @pokemon, partial: 'pokemon', as: :pokemon

# json.array! @pokemon, :name, :image_url

# json.partial! 'pokemon', collection: @pokemon, as: :pokemon
