class Board < ActiveRecord::Base
  belongs_to :user
  has_many :pins, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
end
