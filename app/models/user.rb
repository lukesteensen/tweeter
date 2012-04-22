class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :posts
  has_many :followings
  has_many :followers, through: :followings, class_name: 'User', foreign_key: 'following_id'
  has_many :followees, through: :followings, class_name: 'User', foreign_key: 'followee_id'

  attr_accessible :name, :password, :password_confirmation, :protected

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :name
  validates_uniqueness_of :name

end
