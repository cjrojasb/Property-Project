class AddTypeToPublication < ActiveRecord::Migration[5.0]
  def change
    add_reference :publications, :type, foreign_key: true
  end
end
