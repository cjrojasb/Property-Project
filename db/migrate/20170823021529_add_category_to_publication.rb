class AddCategoryToPublication < ActiveRecord::Migration[5.0]
  def change
    add_reference :publications, :category, foreign_key: true
  end
end
