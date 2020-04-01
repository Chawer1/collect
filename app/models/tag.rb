class Tag < ApplicationRecord
  has_many :taggeds
  has_many :items, through: :taggeds

  def self.counts
    self.select("name, count(taggeds.tag_id) as count").joins(:taggeds).group("taggeds.tag_id")
  end
end
