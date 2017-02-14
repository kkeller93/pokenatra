require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pg'
require_relative 'db/connection'
require_relative 'models/pokemon'


get '/pokemon' do
  @pokemon = Pokemon.all
  erb :"pokemon/index"
end

get '/pokemon/new' do
  erb :"pokemon/new"
end

post '/pokemon' do
  @pokemon = Pokemon.create(params[:pokemon])
  redirect "/pokemon/#{@pokemon.id}"
end

get '/pokemon/:id' do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemon/show"
end

get '/pokemon/edit' do
  @pokemon = Pokemon.find(params[:id])
  erb :"pokemon/edit"
end

put '/pokemon/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.update(params[:pokemon])
  redirect ("/pokemon/#{@pokemon.id}")
end

post '/pokemon/:id' do
  @pokemon = Pokemon.create(params[:pokemon])
  redirect ("/pokemon/#{@pokemon.id}")
end

delete '/pokemon/:id' do
  @pokemon = Pokemon.find(params[:id])
  @pokemon.destroy
  redirect ("/pokemon")
end
