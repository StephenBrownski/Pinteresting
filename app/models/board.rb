class Board < ActiveRecord::Base
  belongs_to :user
  has_many :pins, dependent: :destroy
  scope :has_pins, -> {joins(:pins).uniq }

  validates :name, presence: true
  validates :description, presence: true
end
