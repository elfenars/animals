class RenamePostTipoToType < ActiveRecord::Migration
  def self.up
    rename_column :posts, :tipo, :state
  end

  def self.down
    rename_column :posts, :state, :tipo
  end
end
