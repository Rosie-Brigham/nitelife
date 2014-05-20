require './lib/lastfm_scraper'

desc "Fetch last.fm events"
task :fetch_events => :environment do 
  LastfmScraper.scrape
  puts "Scraped successfully"
end