require 'spec_helper'
require './lib/lastfm_scraper'

describe LastfmScraper do

  describe ".scrape" do
    it "gets information from the web and saves a new event" do

      raw_response_file = File.new("#{Rails.root}/spec/fixtures/lastfm_events_html.txt")
      stub_request(:get, LastfmScraper::URL + '/events').to_return(raw_response_file)

      event_response_file = File.new("#{Rails.root}/spec/fixtures/lastfm_html.txt")
      stub_request(:get, LastfmScraper::URL + '/event/3822140+tUnE-yArDs+at+Village+Underground+on+12+May+2014').to_return(event_response_file)
      
      Timecop.freeze(Time.local(1990)) do
        LastfmScraper.scrape
        expect(Event.first.name).to eq "Real Friends"
      end
    end
  end
end
