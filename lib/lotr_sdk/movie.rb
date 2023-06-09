module LotrSdk
  class Movie < BaseResource
    MAPPINGS = [{ from: '_id', to: 'id' }]

    has_many :quotes, class_name: 'LotrSdk::Quote'
  end
end
