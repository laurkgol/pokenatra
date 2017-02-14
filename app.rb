require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require "active_record" # the ORM
require "pg" # postgres db library
require_relative "db/connection"
require_relative "models/pokemon"



get "/pokemons" do
  @pokemons = Pokemon.all
  erb :"pokemons/index"
end

get "/pokemons/new" do
  erb :"pokemons/new"
end

get "/pokemons/:id" do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemons/show"
end

post "/pokemons" do
  @pokemon = Pokemon.create!(params[:pokemon])
  redirect("/pokemons/#{@pokemon.id}")
end

get "/pokemons/:id/edit" do
  @pokemon = Pokemon.find(params[:id])
  erb :"/pokemons/edit"
end

put "/pokemons/:id" do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.update(params[:pokemon])
  redirect "/pokemons/#{@pokemon.id}"
end

delete "/pokemons/:id" do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.destroy
  redirect "/pokemons"
end

get '/' do
  redirect "/pokemons"
end

#
# # new
# get "/pokemons/new" do
#   erb :new
# end
#
# # create
# post "/pokemons" do
#   @pokemon = pokemon.create!(params[:pokemon])
#   redirect("/pokemons/#{@pokemon.id}")
# end
#
# #show
# get "/pokemons/:id" do
#   @pokemon = pokemon.find(params[:id])
#   erb :show
# end
#
# # edit
# get "/pokemons/:id/edit" do
#   @pokemon = pokemon.find(params[:id])
#   erb :edit
# end
#
# # update
# put "/pokemons/:id" do
#   @pokemon = pokemon.find(params[:id])
#   @pokemon.update(params[:pokemon])
#   redirect("/pokemons/#{@pokemon.id}")
# end
#
# # destroy
# delete "/pokemons/:id" do
#   @pokemon = pokemon.find(params[:id])
#   @pokemon.destroy
#   redirect to("/pokemons")
# end
