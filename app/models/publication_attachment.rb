class PublicationAttachment < ApplicationRecord
  belongs_to :publication
  mount_uploader :photo, PhotoUploader
end
