class AddUserToPublication < ActiveRecord::Migration[5.0]
  def change
    add_reference :publications, :user, foreign_key: true
  end
end
