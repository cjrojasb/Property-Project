class AddRegionToCommune < ActiveRecord::Migration[5.0]
  def change
    add_reference :communes, :region, foreign_key: true
  end
end
