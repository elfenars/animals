class ChangeNameToType < ActiveRecord::Migration
  def up
  	rename_column :posts, :type, :tipo
  end

  def down
  	
  end
end
