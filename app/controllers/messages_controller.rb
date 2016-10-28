class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @messages = current_user.messages.where(private: true)
  end

  def new
    @user = User.find(params[:user_id])
    @message = Message.new(recipient: @user)
  end

  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html {
          redirect_to user_path(@message.recipient), notice: 'Message was successfully created.' }
        format.json {
          render json: { status: :created }
        }
      else
        format.html { redirect_to User.find(params[:user_id]) }
        format.json { render json: { status: :unprocessable_entity, errors: @message.errors.full_messages }}
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:content, :private).merge(sender_id: current_user.id, recipient_id: params[:user_id])
  end
end
