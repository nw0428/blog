class Article < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :likers, source: :user, through: :likes

end
