#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

ActiveRecord::Base.establish_connection(
  :adapter => "mysql2",
  :host => "localhost",
  :username => "root",
  :password => "70sunogo",
  :database => "pizza"
)

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
end

get '/' do
  @product = Product.all
  erb :index
end

get '/about' do
  erb :about
end

post '/cart' do
  orders_input = params[:orders]
  @items = perse_orders_input orders_input

  @items.each do |item|
    item[0] = Product.find(item[0])
  end

  erb :cart
end

post '/place_order' do
  @order = Order.create params[:order]

  erb :order_placed
end

get '/admin_new' do
  erb :admin_new
end

post '/admin_new' do
  @product = Product.create params[:product]

  erb "Дякуєм за замовлення"
end

def perse_orders_input orders_input
  s1 = orders_input.split(/,/)
  arr = []

  s1.each do |x|
    s2 = x.split(/\=/)
    s3 = s2[0].split(/_/)
    id = s3[1]
    cnt = s2[1]
    arr2 = [id, cnt]
    arr.push arr2
  end

  return arr
end