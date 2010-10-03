require 'spec_helper'

describe LastFM do

  describe "self#connect" do
    it "returns a LastFM::Connection initialized with the API key" do
      connection = LastFM.connect('some_api_key')
      connection.should be_kind_of(LastFM::Connection) 
    end
  end

end
