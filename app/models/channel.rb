class Channel < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :conversations
  has_many :posts, through: :conversations

  validates_uniqueness_of :name
  validates_presence_of :name
end
