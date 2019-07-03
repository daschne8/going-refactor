class GoodsSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :occupant_id
end
