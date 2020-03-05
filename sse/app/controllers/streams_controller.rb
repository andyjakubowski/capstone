class StreamsController < ApplicationController
  include ActionController::Live

  def stream
    response.headers['Content-Type'] = 'text/event-stream'
    3.times do
      response.stream.write("hello world\n\n")
      sleep 0.5
    end
  ensure
    response.stream.close
  end

  def sse
    response.headers['Content-Type'] = 'text/event-stream'
    sse = SSE.new(response.stream, retry: 300, event: "greeting")

    3.times do |i|
      sse.write "hello world #{i}"
      sleep 0.5
    end
  rescue IOError
  ensure
    sse.close
  end


end