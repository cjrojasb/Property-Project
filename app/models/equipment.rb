class Equipment < ApplicationRecord
  has_many :property_equipments
  has_many :publications, through: :property_equipments
end
