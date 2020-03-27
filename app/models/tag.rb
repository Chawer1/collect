class Tag < ApplicationRecord
  has_many :taggeds
  has_many :items, through: :taggeds
end
