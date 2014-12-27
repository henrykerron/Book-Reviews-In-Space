class BooksController <ApplicationController

	def new 
		@book = Book.new
	end

	def create
		@book = Book.new(post_params)
		if @book.save
			redirect_to book_path, notice: "New book submitted successfully"
		else
			render :new
	end
end
