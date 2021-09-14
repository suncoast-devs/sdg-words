require "sinatra"
require "sinatra/json"
require "json"
require "amazing_print"
require_relative "words"

if ENV["PORT"]
  set :port, ENV["PORT"]
end

configure do
  enable :cross_origin
end

before do
  response.headers["Access-Control-Allow-Origin"] = "*"
end

options "*" do
  response.headers["Allow"] = "GET, PUT, POST, DELETE, OPTIONS"
  response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
  response.headers["Access-Control-Allow-Origin"] = "*"

  200
end

get "/api/words" do
  json(WORDS)
end

get "/api/words/random" do
  json(WORDS.sample)
end

