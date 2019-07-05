class GoodSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :occupant_id
  belongs_to :occupant
end
