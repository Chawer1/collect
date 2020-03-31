class Item < ApplicationRecord
  has_many :taggeds, dependent: :destroy
  has_many :tags, through: :taggeds, dependent: :destroy
  belongs_to :post
  validates :name, presence: true
  # mappings do
  #   indexes :title,  analyzer: 'english'
  #   indexes :text,  analyzer: 'english'

  def self.search(query)
    __elasticsearch__.search(
        {
            query: {
                multi_match: {
                    query: query,
                    fields: ['title', 'text']
                }
            }
        }
    )
  end
  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.tags = names.split(', ').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
end
