class FavoritesController < ApplicationController

def create
  session[:previous_url] = request.referer
  book = Book.find(params[:book_id])
  favorite = current_user.favorites.new(book_id: book.id)
  favorite.save
  redirect_to session[:previous_url]
end

def destroy
  session[:previous_url] = request.referer
  book = Book.find(params[:book_id])
  favorite = current_user.favorites.find_by(book_id: book.id)
  favorite.destroy
  redirect_to session[:previous_url]
end
end
