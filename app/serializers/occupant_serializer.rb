class OccupantSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :goods
end
