class Post < ActiveRecord::Base
  belongs_to :user

  attr_accessible :body, :user_id

  validates_length_of :body, maximum: 160
end
