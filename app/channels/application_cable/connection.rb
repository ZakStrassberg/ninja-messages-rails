# http://guides.rubyonrails.org/action_cable_overview.html#server-side-components-connections
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    protected
    def find_verified_user
      if current_user = User.find_by(id: cookies.signed['user.id'])
        current_user
      end
    end
  end
end