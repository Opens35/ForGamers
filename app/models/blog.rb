class Blog < ApplicationRecord
  attachment :device_image
  is_impressionable counter_cache: true
  belongs_to :category, optional: true
  has_many :comments, dependent: :delete_all
  validates :title,presence: true
end
