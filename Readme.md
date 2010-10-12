# lastfm

A rather minimal Last.fm client for Ruby. Provides access to all features in the API,
except the ones which require authentication. You are going to need an API key
anyway, though (you can get one for free at [Last.fm](http://www.last.fm/api/account)).

Returns a hash with all the entries you requested.

Compatible with Ruby 1.8, 1.9 and JRuby.

## Usage

Just put it in your Gemfile:

    gem "lastfm", :git => 'git://github.com/codegram/lastfm.git'

Create a connection with your API key:

    require 'lastfm'

    connection = LastFM.connect('my api key')

    result_hash = connection.get_topalbums_from_artist('Cher')  # *yikes*

The syntax is really simple. Last.fm grants non-authenticated access to the following
modules of its API:

* Artist
* Album
* Event
* Geo
* Group
* Tag
* Tasteometer
* Track
* Venue

To see the available methods and required arguments for each of these modules,
please [go to the Wiki](http://github.com/codegram/lastfm/wiki/Available-Last.fm-API-methods).

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add specs for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  If you want to have your own version, that is fine but bump version
  in a commit by itself I can ignore when I pull.
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 Codegram. See LICENSE for details.
