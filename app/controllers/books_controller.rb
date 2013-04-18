class BooksController < ApplicationController

  def results
    @book_title = params[:book_title]
    
    url = "http://www.goodreads.com/search.xml?key=C2Dkie4nQ3ebGr28YjriA&q=#{@book_title}"

    @doc = Nokogiri::XML(open(url))

    @books = []
    @doc.xpath('//search/results/work').each {|node|
    	puts node.inspect
      # puts node.class
      book = {}
      book[:b_id] = node.at_xpath('./id').content
      book[:title] = node.at_xpath('./best_book/title').content 
      book[:author] = node.at_xpath('./best_book/author/name').content
      book[:image_url] = node.at_xpath('./best_book/image_url').content
      @books << book
    }

  end

  def create
   
  end

end

