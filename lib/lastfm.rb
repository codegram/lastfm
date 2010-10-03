require 'lastfm/connection'

module LastFM

  API_URL = 'http://ws.audioscrobbler.com/2.0'

  class << self
    def connect(key)
      Connection.new(key)
    end
  end

end
