class PublicationAttachment < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :publication
end
