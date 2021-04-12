class CreateAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :animals do |t|
      t.string  :name,                  null: false
      t.text    :text,                  null: false
      t.integer :category_id,           null: false
      t.integer :storage_place_pet_id,  null: false
      t.integer :prefecture_id,         null: false
      t.integer :storage_time_id,       null: false
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
