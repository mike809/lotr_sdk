module LotrSdk
  class Quote < BaseResource
    MAPPINGS = [{ from: 'movie', to: 'movie_id' }]

    belongs_to :movie, class_name: 'LotrSdk::Movie'
  end
end
