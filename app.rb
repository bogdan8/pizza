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
  validates :title, presence: true , length: {minimum: 2 , maximum:50}
  validates :description, presence: true
  validates :price, presence: true
  validates :size, presence: true
  validates :path_to_image, presence: true
end

class Order < ActiveRecord::Base
  validates :name, presence: true , length: {minimum: 2 , maximum:50}
  validates :phone, presence: true
  validates :address, presence: true
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
  @order = Order.new params[:order]
  if @order.save
    erb :order_placed
  else
    @error = @order.errors.full_messages
    erb :cart
  end
end

get '/admin_new' do
  erb :admin_new
end

post '/admin_new' do
  @product = Product.new params[:product]
  if @product.save
    erb "Дякуєм за замовлення"
  else
    @error = @product.errors.full_messages
    erb :admin_new
  end
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