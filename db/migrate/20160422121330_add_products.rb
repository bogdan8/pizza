class AddProducts < ActiveRecord::Migration
  def change
  	Product.create {
  		:title => 'Hawaiian',
  		:description => 'This hawaiian pizza',
  		:price => 80,
  		:size => 30,
  		:is_spicy => false,
  		:is_veg => false,
  		:is_best_offer => false,
  		:path_to_image => '/images/1.jpg'
  	}
  end
end
