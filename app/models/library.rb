require 'net/http'
# require 'wombat'

class Library
  def self.search
    list = GoodreadsAccount.want_to_read_list

    title = list.first
    # list.each do |title|
      # uri = URI.parse("/montage/stanton/All.aspx?≈" + { keyword: title.gsub!(' ', '+') }.to_query)
    # end


    # Wombat.crawl do
    #   debugger
    #   base_url "https://www.aurorashore.com.au"
    #   path "/montage/stanton/All.aspx?keyword=#{title.gsub!(' ', '+')}"

    #   book_list css: "#slot-1"

    #   book_headings css: "h2"
    #   debugger
    # end
    
    debugger
    doc = Nokogiri::HTML(open("https://www.aurorashore.com.au/montage/stanton/All.aspx?keyword=Big+Magic:+Creative+Living+Beyond+Fear", :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))

  end

end