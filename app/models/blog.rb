class Blog < ApplicationRecord
  belongs_to :categories, dependent: :destroy
  has_many :comments, dependent: :delete_all
  validates :title,presence: true
end
