class List < ApplicationRecord
    belongs_to :user
    has_many :items 
    accepts_nested_attributes_for :items

    validates :user_id, presence: true
    validates :title, presence: true
    #validates :private, presence: true
end
