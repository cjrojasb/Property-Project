class AddCountViewsToPublication < ActiveRecord::Migration[5.0]
  def change
    add_column :publications, :page_views, :integer, default: 0
  end
end
