module ActiveResource
  module Formats
    class LotrFormat
      extend ActiveResource::Formats::JsonFormat

      def self.decode(json)
        return nil if json.nil?
        Formats.remove_root(ActiveSupport::JSON.decode(json)['docs'])
      end
    end
  end
end
