require 'spec_helper'

module LastFM
  describe Connection do

    let(:connection) do
      api_key = API_KEY
      LastFM.connect(api_key)
    end

    describe "unobtrusive method_missing" do
      it "ignores any method that doesn't look like one of the API" do
        expect{connection.send(:some_method)}.to raise_error(NoMethodError)
      end
    end

    describe "API methods (which do not require authentication)" do

      after(:each) do
        VCR.eject_cassette
      end

      context "artist" do
        %w{events images info pastevents podcast shouts similar topalbums topfans toptags toptracks search}.each do |element|
          specify "#get_#{element}_from_artist" do
            VCR.insert_cassette "artist/#{element}_from_cher", :record => :new_episodes
            expect {connection.send(:"get_#{element}_from_artist",'Cher')}.to_not raise_error
          end
        end
      end

      context "album" do
        %w{buylinks info toptags search}.each do |element|
          specify "#get_#{element}_from_album" do
            VCR.insert_cassette "album/#{element}_from_believe", :record => :new_episodes
            expect {connection.send(:"get_#{element}_from_album",'Believe', :artist => 'Cher', :country => 'united kingdom')}.to_not raise_error
          end
        end
      end

      context "event" do
        %w{attendees info shouts}.each do |element|
          specify "#get_#{element}_from_event" do
            VCR.insert_cassette "event/#{element}_from_328799", :record => :new_episodes
            expect {connection.send(:"get_#{element}_from_event",'328799')}.to_not raise_error
          end
        end
      end
      
      context "geo" do
        %w{events MetroArtistChart MetroHypeArtistChart MetroHypeTrackChart MetroTrackChart MetroUniqueArtistChart MetroWeeklyChartlist metros topartists toptracks}.each do |element|
          specify "#get_#{element}_from_geo" do
            VCR.insert_cassette "geo/#{element}_from_madrid", :record => :new_episodes
            expect {connection.send(:"get_#{element}_from_geo", :country => 'Spain', :metro => 'Madrid')}.to_not raise_error
          end
        end
      end
      
      context "group" do
        %w{hype members weeklyalbumchart weeklyartistchart weeklychartlist weeklytrackchart}.each do |element|
          specify "#get_#{element}_from_group" do
            VCR.insert_cassette "group/#{element}_from_radiohead", :record => :new_episodes
            expect {connection.send(:"get_#{element}_from_group",'radiohead')}.to_not raise_error
          end
        end
      end

      context "tag" do
        %w{similar topalbums topartists toptags toptracks weeklyartistchart weeklychartlist search}.each do |element|
          specify "#get_#{element}_from_tag" do
            VCR.insert_cassette "tag/#{element}_from_disco", :record => :new_episodes
            expect {connection.send(:"get_#{element}_from_tag",'disco')}.to_not raise_error
          end
        end
      end

      context "tasteometer" do
        %w{compare}.each do |element|
          specify "#get_#{element}_from_tasteometer" do
            VCR.insert_cassette "tasteometer/#{element}_txusfm_and_josepjaume", :record => :new_episodes
            expect {connection.send(:"get_#{element}_from_tasteometer", :type1 => 'user', :type2 => 'user', :value1 => 'txusfm', :value2 => 'josepjaume')}.to_not raise_error
          end
        end
      end

      context "track" do
        %w{buylinks info similar topfans toptags search}.each do |element|
          specify "#get_#{element}_from_track" do
            VCR.insert_cassette "track/#{element}_from_creep", :record => :new_episodes
            expect {connection.send(:"get_#{element}_from_track",'creep', :artist => 'radiohead', :country => 'united kingdom')}.to_not raise_error
          end
        end
      end

      context "venue" do
        %w{events pastevents search}.each do |element|
          specify "#get_#{element}_from_venue" do
            VCR.insert_cassette "venue/#{element}_from_arena", :record => :new_episodes
            expect {connection.send(:"get_#{element}_from_venue",'8908030')}.to_not raise_error
          end
        end
      end

    end

  end
end
