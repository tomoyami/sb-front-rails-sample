class EventsController < ApplicationController
  def show
    event = RestClient.get "https://sb-api.tes.co.jp/api/v1/event/#{params[:id]}", current_user.request_headers
    @event = Responses::Event.value_of(JSON.parse(event))
    p @event
  end
end
