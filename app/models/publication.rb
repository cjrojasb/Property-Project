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

  geocoded_by :address  
  after_validation :geocode  

  #Validaciones
  #validates :title, presence: {message_: "Título es requerido" }
  #validates :description, presence: {message: "Descripción es requerida"}
  #validates :address, presence: {message: "Dirección es requerida"}

  # Scopes
  scope :by_title, -> (search) { where("title ilike ? OR description ilike ?", "%#{search}%", 
        "%#{search}%")}

  def next
    Publication.where(["id > ?", id]).first
  end

  def prev
    Publication.where(["id < ?", id]).last
  end


end
