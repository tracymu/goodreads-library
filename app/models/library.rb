require 'pincers'



class Library
  def self.search
    library_list = {}

    list = GoodreadsAccount.want_to_read_list

    list.each do |title|
      url = "https://www.aurorashore.com.au/montage/stanton/All.aspx?keyword=" + title.gsub(' ', '+').gsub('(','').gsub(')','')
      Pincers.for_webdriver :chrome do |pincers|
        pincers.goto url
        sleep(4)

        no_results_found = pincers.search(".content_wrapper:contains('No results found')")

        puts "........................................"
        puts "For search on '#{title}'"
        if no_results_found.count > 1 # because it searches in books and in audio or something
          puts "No results found"
        else
          found_title = pincers.search(".large-5.main_col").first.search(".alt_title").text
          availability = pincers.search(".large-5.main_col").first.search(".alt_sec").text
          puts "Found '#{found_title}'"
          puts availability

          if availability.present? && availability != "0 Items available."
            library_list[found_title] = availability
          end
        end
      end
    end

    puts "LIST OF FOUND BOOKS"
    library_list.each do |title, location|
      puts title
      puts location
      puts "......................."
    end
  end

end

