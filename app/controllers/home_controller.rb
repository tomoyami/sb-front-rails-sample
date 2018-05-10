class HomeController < ApplicationController
  def index
    events = RestClient.get 'https://sb-api.tes.co.jp/api/v1/event?limit=5&order=desc', current_user.request_headers

    events = JSON.parse(events.body)
    @events = events.map { |event| Responses::Event.value_of(event) }
  end

  def sample
  end
end
