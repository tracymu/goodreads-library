require 'nokogiri'
require 'open-uri'
require 'net/http'

GOODREADS_API_KEY = 'SCReakvlNiPlJzJdJLT4Q'
GOODREADS_API_SECRET = 'LVkOLDs1lX5L1EmFOZ3mVL90JAnuU7Aeu25FxbvidEk'

class GoodreadsAccount
  def self.want_to_read_list

    user_url = 'https://www.goodreads.com/review/list?v=2&id=61008142&shelf=to-read&key=SCReakvlNiPlJzJdJLT4Q&per_page=200'
    uri = URI.parse(user_url)
    user_xml = Net::HTTP.get(uri)

  


    doc = Nokogiri::XML.parse(user_xml)

    titles = doc.xpath('//review').first.xpath('//title').map  { |t| t.text }
    titles
# debugger
    # doc.xpath('//character').each do |char_element|
    #  puts char_element.text
    #  end    
  end


end

