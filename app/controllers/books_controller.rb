class BooksController < ApplicationController

def index
	@user = User.find(current_user.id)
	@review = Book.new
	@books = Book.all
end

def show
	@user = User.find(current_user.id)
	@review = Book.find(params[:id])
end

def destroy
	book = Book.find[parmas[:id]]
	book = Book.destroy
	redeirect_to books_path(current_user.id)
end

def create
	review = current_user.books.new(book_params)
	review.save
	redirect_to book_path(review)
end



private
def book_params
	params.require(:book).permit(:title, :body)
end
end