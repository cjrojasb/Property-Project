class AddProvinceToCommune < ActiveRecord::Migration[5.0]
  def change
    add_column :communes, :province, :string
  end
end
