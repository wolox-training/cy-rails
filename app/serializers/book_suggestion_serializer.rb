class BookSuggestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :link, :user_id
end
