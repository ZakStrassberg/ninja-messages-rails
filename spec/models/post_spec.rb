require 'rails_helper'
RSpec.describe Post do
  before do
    @channel = Channel.create(name:"Test channel", description:"Test channel",)
    @conversation = Conversation.create(name:"Test conversation", user_id: 1, channel: @channel)
    @user = User.create(name:"Test user", email: "test@test.com")
  end

  it 'requires a user' do
    post = Post.new(conversation: @conversation, message: "test")
    expect(post.save).to be false

    post.user = @user
    expect(post.save).to be true
  end

  it 'requires content' do
    post = Post.new(conversation: @conversation, user: @user)
    expect(post.save).to be false

    post.message = "Test"
    expect(post.save).to be true
  end
end