class BooksController < ApplicationController

def new
  @new_book = Book.new
end
end
