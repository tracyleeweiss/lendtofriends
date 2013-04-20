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
      book[:id] = node.at_xpath('./id').content
      book[:title] = node.at_xpath('./best_book/title').content 
      book[:author] = node.at_xpath('./best_book/author/name').content
      book[:image_url] = node.at_xpath('./best_book/image_url').content
      @books << book
  }

end

def create

end

def add

	Book.create({
		:title => params[:book_title],
		:author => params[:book_author],
		:id => params[:book_id],
		:image_url => params[:book_image],
   	:owner_id => false #current_user.id
   	}) 

end

def library

	@books = Book.all

end

def update
	@book = Book.find(params[:id])
	@book.borrower_name = params[:book][:borrower_name]
	@book.save
	puts params

	redirect_to '/library'
end

def checked_out
	@books = Book.where("borrower_name <> ''")
end

def send_email
	@to = params[:to]
	@subject = params[:subject]
	YourMailer.form_email(@to, @subject, params[:body]).deliver

end




end

