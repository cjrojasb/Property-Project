class RemoveEquipmentFromPublication < ActiveRecord::Migration[5.0]
  def change
    remove_column :publications, :equipment, :string
  end
end
