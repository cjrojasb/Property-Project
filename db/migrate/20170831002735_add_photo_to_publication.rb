class AddPhotoToPublication < ActiveRecord::Migration[5.0]
  def change
    add_column :publications, :photo, :string
  end
end
