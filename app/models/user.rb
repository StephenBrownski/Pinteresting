class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  has_many :pins, dependent: :destroy
  has_many :boards, dependent: :destroy
  has_many :likes, dependent: :destroy

  def likes?(post)
    post.likes.where(user_id: id).any?
  end
end
