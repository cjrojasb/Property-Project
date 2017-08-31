class Commune < ApplicationRecord
  belongs_to :region
  has_many :publications
end