#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :host     => "localhost",
  :username => "root",
  :password => "70sunogo",
  :database => "pizza"
)

class Product < ActiveRecord::Base

end

get '/' do
	@product = Product.all
	erb :index	
end

get '/about' do
	erb :about
end