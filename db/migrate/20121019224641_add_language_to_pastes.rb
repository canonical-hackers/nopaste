class AddLanguageToPastes < ActiveRecord::Migration
  def change
    add_column :pastes, :language, :string, :default => :text
  end
end
