class CreatePublications < ActiveRecord::Migration[5.0]
  def change
    create_table :publications do |t|
      t.string :title
      t.integer :bedroom
      t.integer :bath
      t.integer :parking
      t.string :equipment
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
