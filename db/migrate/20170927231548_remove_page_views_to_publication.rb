class RemovePageViewsToPublication < ActiveRecord::Migration[5.0]
  def change
    remove_column :publications, :page_views, :integer
  end
end
