class AddPageViewsToPublication < ActiveRecord::Migration[5.0]
  def change
    add_column :publications, :page_views, :integer
  end
end
