require "http/client"
require "json"
require "./tmdb/*"

module Tmdb
  def self.connect(api_key)
    Tmdb::Api.instance.tap do |api|
      api.connect(api_key)
    end
  end
end

Tmdb.connect("8a221fc31fcdf12a8af827465574ffc9")
puts Tmdb::Configuration.list.inspect
