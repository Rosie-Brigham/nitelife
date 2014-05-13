class LastfmScraper
  URL = "http://www.last.fm"

  def self.scrape
    entry_point = URL + '/events'
    @doc = Nokogiri::HTML(open(entry_point))

    @doc.css("table.eventsMedium tr .detail a").each do |node|
      artist_class = Artist.new
      event = Event.new
      eventpath = node.first[1]
   
      # now... we need to visit each of the individual sites and scrape the info from there to!
      eventurl = URL + eventpath
      eventdoc = Nokogiri::HTML(open(eventurl))

      # gets the title/artist
      artist_name = eventdoc.css(".page-head.without-crumbtrail h1 a").text

      if artist_name == ""
        artist_name = eventdoc.css(".page-head.without-crumbtrail h1").text
      end

      artist_class.name = artist_name
      artist_class.save
        
      event.artist_id = artist_class.id
      event.name = artist_name

      # gets the venue
      eventdoc.css("p.venue a").each do |node|
        event.venue = node.text
      end

        # getting the description
      long_description = eventdoc.css(".wiki-text").text
      if long_description
        event.description = long_description.split('http').first
      end

      # getting the venue website
      eventdoc.css("#venue a.url").each do |node|
        event.url = node.attributes["href"].value
      end

      # getting the event image url
      event.photo_url = eventdoc.css("#smallPoster img").first.attributes['src'].value

      # getting the atetime object
      @last_datetime = eventdoc.css("abbr.dtstart").first.attributes['title']
      date, time = @last_datetime.text.split('T')
      event.date = Date.parse(date)
      event.time = DateTime.parse(time)
      
      event.genre = 'Concert'
      event.save!
      puts "just saved #{event.name} on at #{event.date}:#{event.time.hour}"
     end
   end
end

