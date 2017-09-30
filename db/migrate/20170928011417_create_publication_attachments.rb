class CreatePublicationAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :publication_attachments do |t|
      t.string :photo
      t.references :publication, foreign_key: true

      t.timestamps
    end
  end
end
