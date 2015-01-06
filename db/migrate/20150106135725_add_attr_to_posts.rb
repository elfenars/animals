class AddAttrToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :animal_type, :string
  	add_column :posts, :breed, :string
  	add_column :posts, :age, :string
  end
end
