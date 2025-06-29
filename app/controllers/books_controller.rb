class BooksController < ApplicationController
  def top
  end

  def new
    @book = Book.new
  end

  def index
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to book_path(@book)
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
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
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
