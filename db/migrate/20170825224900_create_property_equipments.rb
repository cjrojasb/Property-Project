class CreatePropertyEquipments < ActiveRecord::Migration[5.0]
  def change
    create_table :property_equipments do |t|
      t.references :publication, foreign_key: true
      t.references :equipment, foreign_key: true

      t.timestamps
    end
  end
end
