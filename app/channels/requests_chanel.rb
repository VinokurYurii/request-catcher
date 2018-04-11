class RequestsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'catcher'
  end
end