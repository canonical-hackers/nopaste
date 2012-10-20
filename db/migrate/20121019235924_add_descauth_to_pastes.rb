class AddDescauthToPastes < ActiveRecord::Migration
  def change
    add_column :pastes, :description, :string
    add_column :pastes, :author, :string
  end
end
