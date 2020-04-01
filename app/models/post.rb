class Post < ApplicationRecord
  # has_one_attached :image
  # belongs_to :user
  # has_rich_text :image
  # has_many: taggings
  # has_many: tags, through: taggings
  has_many :items, dependent: :destroy
  # has_ancestry
  mount_uploader :image, ImageUploader
  validates :title, :summary, :topic, presence: true
end
