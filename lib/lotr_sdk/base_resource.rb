require 'active_resource'

module LotrSdk
  class BaseResource < ::ActiveResource::Base
    self.site = 'https://the-one-api.dev/v2'
    self.include_format_in_path = false

    self.auth_type = :bearer
    self.bearer_token = ENV['LOTR_API_KEY']
    self.format = :lotr

    class << self
      attr_accessor :data_mappings

      def collection_name
        @collection_name ||= name.demodulize.underscore
      end

      def find(*arguments)
        scope   = arguments.slice!(0)
        options = arguments.slice!(0) || {}

        if params = options[:params]
          self::MAPPINGS.each do |mapping|
            params[mapping[:from].to_sym] = params.delete(mapping[:to].to_sym)
          end
        end

        super(scope, options)
      end

      def instantiate_record(record, prefix_options = {})
        record = normalize_data(record)
        super(record, prefix_options)
      end

      def normalize_data(data)
        # TODO: This is a hack to get around the fact that
        # the API returns an array of data when asking for a single record
        data = data.first if data.is_a?(Array)

        self::MAPPINGS.each do |mapping|
          data[mapping[:to]] = data.delete(mapping[:from])
        end

        data
      end
    end
  end
end
