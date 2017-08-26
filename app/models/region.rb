class Region < ApplicationRecord
  has_many :communes
  has_many :publications
end
