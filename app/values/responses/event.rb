module Responses
  class Event
    include Virtus.value_object

    attribute :id, Integer
    attribute :name, String

    def self.value_of(params)
      new(
        id: params['id'],
        name: params['name']
      )
    end
  end
end
