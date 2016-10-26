class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :destroy, :update, :edit]

  def new
    @post = Post.new(channel: Channel.find(params[:channel_id]))
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        # binding.pry
        # puts "\n\n\n\n!!!!!!!!!!!"
        # puts request.format

        ConversationChannel.broadcast_to(@post.conversation, @post.as_json( include: { user:  { only: :name } } ) )
        ActionCable.server.broadcast("default", {newPost: @post})
        format.html {
          puts "\n\n\n\n\n\nHTML RESPONSE"
          redirect_to channel_conversation_path(@post.conversation.channel, @post.conversation, @post), notice: 'Post was successfully created.' }
        format.json {
          puts "\n\n\n\n\n\nJSON RESPONSE"
          render json: { status: :created }
        }
      else
        format.html { render :new }
        format.json { render json: { status: :unprocessable_entity, errors: @post.errors.full_messages }}
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:message).merge(user: current_user, conversation_id: params[:conversation_id])
  end
end
