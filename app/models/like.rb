class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :likeable, polymorphic: true

  validates :likeable_id, presence: true
  validates :likeable_type, presence: true
  validates :user_id, presence: true
end
