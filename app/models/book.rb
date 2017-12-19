class Book < ApplicationRecord
  has_and_belongs_to_many :author
  belongs_to :category
  belongs_to :publisher

  validates :title, presence: true
end
