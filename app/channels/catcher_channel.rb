class CatcherChannel < ApplicationCable::Channel
  def subscribed
    stream_from "catcher_#{params[:path]}"
  end
end