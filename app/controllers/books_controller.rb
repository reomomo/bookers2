class BooksController < ApplicationController
  def index
    @booker = Book.new
    @books = Book.all

  end

  def create
    @books = Book.all
    @booker = Book.new(book_params)
    @booker.user_id = current_user.id
    if @booker.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@booker.id)
    else
      render :index
    end
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
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end  
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def destroy_user_session_path
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

end
