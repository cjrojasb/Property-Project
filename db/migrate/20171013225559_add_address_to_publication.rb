class AddAddressToPublication < ActiveRecord::Migration[5.0]
  def change
    add_column :publications, :address, :string
    add_column :publications, :latitude, :float
    add_column :publications, :longitude, :float
  end
end
