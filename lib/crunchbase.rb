require 'open-uri'
require 'Nokogiri'

class Crunchbase

  attr_accessor :url
  attr_accessor :doc

  def initialize(url)
    self.url = url
    self.doc = Nokogiri::HTML(open(url))
  end

  def scrape_description
    # card = $("#info-card-overview-content .definition-list")[0]
    card.css("dd")[1].text

    # $(card).find("div dl div")[1]

    #...todo: get description
  end

  def scrape_website
     card.css("dd")[4].text
  end

  def card
    doc.css("#info-card-overview-content div.definition-list").first
  end

end