class Blog < ApplicationRecord
  belongs_to :categories, dependent: :destroy
  validates :title,presence: true
end
