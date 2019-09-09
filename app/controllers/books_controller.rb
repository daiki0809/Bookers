class BooksController < ApplicationController
  def top
  end

  def index
  	@books = Book.all.order(created_at: :desc)
  	@book = Book.new
  end

  def new
  	@book = Book.new
  end

  def create
  	book = Book.new(book_params)
  	book.save
    if book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book
    else
      @books = Book.all
      @book = book
      render action: :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end


  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    if book.update(book_params)
      flash[:aaa] = "Book was successfully update."
    redirect_to book
  else
    @book = Book.find(params[:id])
    @book = book
    render action: :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    if book.destroy
      flash[:bbb] = "Book was successfully destroyed."
    redirect_to books_path
    else
      redirect_to books_path
    end
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
