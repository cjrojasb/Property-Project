class AddCommuneToPublication < ActiveRecord::Migration[5.0]
  def change
    add_reference :publications, :commune, foreign_key: true
  end
end
