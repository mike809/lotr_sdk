require "lotr_sdk/version"

module LotrSdk
  class Error < StandardError; end

  if defined?(Rails)
    Bundler.require(*Rails.groups)
    Dotenv::Railtie.load
  end
end

require 'active_resource'
require "active_resource/formats/lotr_format"
require "lotr_sdk/base_resource"
require "lotr_sdk/quote"
require "lotr_sdk/movie"
