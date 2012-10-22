class AddPrivateToPastes < ActiveRecord::Migration
  def change
    add_column :pastes, :private, :boolean, :default => false
  end
end
