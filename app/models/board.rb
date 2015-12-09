class Board < ActiveRecord::Base
  belongs_to :user
  has_many :pins, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  scope :has_pins, -> {joins(:pins).uniq }
  scope :visible, -> {where(public: true)}
  scope :invisible, -> {where(public: false)}

  validates :name, presence: true
  validates :description, presence: true
end
