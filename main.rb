require "sinatra"
require "sinatra/activerecord"
require "./models"

set :database, "sqlite3:example_database.sqlite3"

get "/" do
  text = ''
  Post.all.each do |post|
    text += post.title + ' ' + post.content + '<br/>'
  end

  text
end

get "/make" do
  erb :create_form
end

get "/write" do
  Post.create(params)
end
