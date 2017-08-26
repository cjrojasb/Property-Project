class AddRegionToPublication < ActiveRecord::Migration[5.0]
  def change
    add_reference :publications, :region, foreign_key: true
  end
end
