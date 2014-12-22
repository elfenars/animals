class AddTypeAndPictureToPost < ActiveRecord::Migration
  def change
    add_column :posts, :type, :string
    add_column :posts, :picture, :string
  end
end
