class Conversation < ApplicationRecord
  belongs_to :user
  belongs_to :channel
  has_many :posts

  validates_presence_of :name, :user, :channel
end
