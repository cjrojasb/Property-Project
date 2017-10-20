class Publication < ApplicationRecord
  #mount_uploader :photo, PhotoUploader
  
  belongs_to :user
  belongs_to :commune, optional: true
  belongs_to :region, optional: true
  belongs_to :category, optional: true
  belongs_to :type, optional: true

  has_many :property_equipments, dependent: :destroy
  has_many :equipments, through: :property_equipments

  has_many :publication_attachments, dependent: :destroy
  accepts_nested_attributes_for :publication_attachments

  attr_accessor :equipments_ids

  # Geo Coder
  # reverse_geocoded_by :latitude, :longitude
  # after_validation :reverse_geocode

  geocoded_by :address  
  after_validation :geocode  

  #Validaciones
  validates :title, presence: {message_: "Título es requerido" }
  validates :description, presence: {message: "Descripción es requerida"}
  validates :address, presence: {message: "Dirección es requerida"}

  # def increment(by = 1)
  #   self.page_views ||= 0
  #   self.page_views += by
  #   self.save
  #   page_views
  # end
end
