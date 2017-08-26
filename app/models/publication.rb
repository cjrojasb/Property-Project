class Publication < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :commune, optional: true
  belongs_to :region, optional: true
  belongs_to :category, optional: true
  belongs_to :type, optional: true

  has_many :property_equipments
  has_many :equipments, through: :property_equipments

  attr_accessor :equipments_ids

end
