class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, :summary, :topic, presence: true
end
