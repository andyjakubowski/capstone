module ApplicationCable
  class Connection < ActionCable::Connection::Base
    def connect
      puts 'ApplicationCable::Connection#connect'
    end
  end
end
