class CreateAnimals < ActiveRecord::Migration[5.1]
  def change
    create_table :animals do |t|
      t.string :name
      t.integer :years
      t.integer :species, default: 0
      t.integer :status, default: 0
      t.string :breed
      t.string :main_image
      t.string :thumb_image
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
