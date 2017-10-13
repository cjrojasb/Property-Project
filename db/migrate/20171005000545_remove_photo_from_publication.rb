class RemovePhotoFromPublication < ActiveRecord::Migration[5.0]
  def change
    remove_column :publications, :photo, :string
  end
end
