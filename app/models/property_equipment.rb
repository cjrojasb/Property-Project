class PropertyEquipment < ApplicationRecord
  belongs_to :publication
  belongs_to :equipment
end
