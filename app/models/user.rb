class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, :dependent => :destroy
  has_many :likes, :dependent => :destroy

  def is_like? (post)
    Like.find_by(user_id: self.id, post_id: post.id).present?
  end
end
