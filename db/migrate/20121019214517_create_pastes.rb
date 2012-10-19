class CreatePastes < ActiveRecord::Migration
  def change
    create_table :pastes, :id => false do |t|
      t.string :uuid, :limit => 36, :primary => true
      t.text :content

      t.timestamps
    end
  end
end
