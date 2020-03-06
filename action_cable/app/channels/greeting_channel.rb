class GreetingChannel < ApplicationCable::Channel
  def subscribed
    stream_from "greeting"
    animalName = params[:animal]
    message = "#{animalName} has entered the room!"
    ActionCable.server.broadcast('greeting', { message: message })
  end

  def unsubscribed
    # puts 'GreetingChannel#unsubscribed'
    # Any cleanup needed when channel is unsubscribed
  end

  def say_hi
    # puts 'Server says hi'
  end
end
