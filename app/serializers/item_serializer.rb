class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :list_id, :status
end
