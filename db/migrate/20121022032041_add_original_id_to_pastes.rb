class AddOriginalIdToPastes < ActiveRecord::Migration
  def change
    add_column :pastes, :original_id, :string
  end
end
