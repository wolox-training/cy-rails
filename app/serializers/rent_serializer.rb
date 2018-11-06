class RentSerializer < ActiveModel::Serializer
  attributes :id, :init_date, :end_date, :book, :user
end
