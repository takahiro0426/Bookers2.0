class BooksController < ApplicationController
	before_action :authenticate_user!


	def index
		@user = User.find(current_user.id)
		@review = Book.new
		@books = Book.all
	end

	def show
		@comments = BookComment.all
		@book = Book.find(params[:id])
		@user = @book.user
		@review = Book.new
		@book_comment = BookComment.new
	end

	def edit
		@book = Book.find(params[:id])
		if @book.user == current_user
			render :edit
		else
			redirect_to books_path
		end
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			redirect_to book_path(@book), flash: {success: "You have updated book successfully."}
		else
			render :edit
		end

	end

	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to books_path
	end

	def create
		@review = current_user.books.new(book_params)
		if @review.save
			redirect_to book_path(@review), flash: {success: "You have creatad book successfully."}
		else
			@user = User.find(current_user.id)
			@books = Book.all
			render :index
		end
	end



	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end