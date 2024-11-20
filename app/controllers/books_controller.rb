class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = "error"
      @books = Book.all
      render :index
    end
  end
  
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end



  def update
   @book = Book.find(params[:id])
   if @book.update(book_params) 
    flash[:notice] = "successfully"
    redirect_to book_path(@book.id)
   else
    flash.now[:alert] ="error"
    render :edit
   end
  end



  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
