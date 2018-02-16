class InsecureUserSerializerSerializer < ActiveModel::Serializer
  attributes :id, :email, :name

  def full_name
    object.name
  end
end
