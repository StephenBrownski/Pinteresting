class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :likeable_id
      t.integer :likeable_type
      t.integer :user_id
      t.timestamps null: false
    end

    add_index :likes, :likeable_id
  end
end