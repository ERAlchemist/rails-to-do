class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :created_at

  def name
    object.username
  end

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
