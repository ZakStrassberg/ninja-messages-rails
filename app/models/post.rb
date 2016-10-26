class Post < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :message
  # after_create_commit {MessageBroadcastJob.perform_now self}
end
