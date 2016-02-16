require 'net/http'
require 'json'
require 'pry'

class PokemonService

  def get(url: "http://pokeapi.co/api/v2/", path: path)
    uri = URI(url + path + "/")
    response = Net::HTTP.get_response(uri)
    JSON.parse(response.body)
  end

  def pokemon_information(info)
    path = "pokemon/#{info}"
    get(path: path)
  end

  def get_moves_for(pokemon)
    response = pokemon_information(pokemon)
    response["moves"].map { |move| move["name"] }
  end

  def get_evolutions_for(pokemon)
    response = pokemon_information(pokemon)
    response["evolutions"].map { |evolution| evolution["to"] }
  end

  def get_types_for(pokemon)
    response = pokemon_information(pokemon)
    response["types"].map { |type| type["name"] }
  end

  def get_pokemon_for(type)
    path = "type/#{type}"
    response = get(path: path)
    response["pokemon"].map {|element| element["pokemon"]["name"]}
  end

end
