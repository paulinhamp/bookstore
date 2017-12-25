class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :pages
  belongs_to :category,  serializer: CategorySerializer
  belongs_to :publisher, serializer: PublisherSerializer
  has_many   :authors,   serializer: AuthorSerializer
end
