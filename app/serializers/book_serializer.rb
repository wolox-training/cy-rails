class BookSerializer < ActiveModel::Serializer
  attributes :id, :genero, :autor, :image, :titulo, :editor, :anio
end
