class AddUserIdToPastes < ActiveRecord::Migration
  def change
    add_column :pastes, :user_id, :integer
  end
end
