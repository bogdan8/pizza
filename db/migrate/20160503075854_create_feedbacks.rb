class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text :name
      t.text :phone
      t.text :descriptions

      t.timestamps
    end
  end
end
