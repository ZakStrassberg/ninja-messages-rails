class NotificationChannel < ApplicationCable::Channel
  @@active_users = []
  @@guests = 0

  def subscribed
    stream_from "#{params[:room]}"
    if user = current_user
      @@active_users.push(user)
    else
      @@guests += 1
    end
    ActionCable.server.broadcast("default", {activeUsers: @@active_users, guests: @@guests})
  end

  def unsubscribed
    if user = current_user
      @@active_users.delete(user)
    else
      @@guests -= 1
    end
  end

  # periodically :transmit_progress, every: 5.seconds
  #
  periodically every: 10.seconds do
    ActionCable.server.broadcast("default", {activeUsers: @@active_users, guests: @@guests})
  end
end