class BookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :image, :publisher, :year,
             :genre, :actual_rent, :created_at, :updated_at
end
