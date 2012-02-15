class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user
      t.string :name
      t.date :birthday
      t.text :bio
      t.string :color
      t.string :twitter

      t.timestamps
    end
    
    add_index :profiles, :user_id
  end
end
