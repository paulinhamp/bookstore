class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  belongs_to :category
  belongs_to :publisher

  validates :title, presence: true

  searchkick
end
