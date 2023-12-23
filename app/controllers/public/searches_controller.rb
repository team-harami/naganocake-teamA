class Public::SearchesController < ApplicationController
    
    def search_genre
        @genre = Genre.find(params[:id])
        @items = Item.where(genre_id: @genre.id, is_active: true).page(params[:page])
    end
    
    def search_items
        @word = params[:word]
        @items = Item.where(is_active: true).where( "name LIKE?", "%#{@word}%").page(params[:page])
    end
end
