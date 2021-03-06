class Pin < ActiveRecord::Base
  belongs_to :user
  belongs_to :board
  has_many :likes, as: :likeable, dependent: :destroy

  has_attached_file :image, styles: { large: '1024x1024>', medium: '300x300>', thumb: '100x100#'}
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png"]
  validates :image, presence: true
  validates :description, presence: true
end
