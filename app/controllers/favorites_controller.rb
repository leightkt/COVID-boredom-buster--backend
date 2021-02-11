class FavoritesController < ApplicationController

    def index
        @favorites = Favorite.all
        render json: @favorites, include: [:user, :activity]
    end

    def show
        @favorite = Favorite.find(params[:id])
        render json: @favorite, include: [:user, :activity]
    end

    def create
        @newFavorite = Favorite.create(
            user_id: params[:user_id],
            activity_id: params[:activity_id]
        )
        render json: @newFavorite, include: [:user, :activity]
    end

    def update
        @favorite = Favorite.find(params[:id])
        @favorite.update(
            user_id: params[:user_id],
            activity_id: params[:activity_id]
        )
        render json: @favorite, include: [:user, :activity]
    end
    
    def destroy
        @favorite = Favorite.find(params[:id])
        @favorite.destroy
    end

    def newFav
        @user_id = params[:user_id].to_i
        @activity_id = params[:activity_id].to_i
        @favorite = Favorite.where("user_id = ? AND activity_id = ?", @user_id, @activity_id)
        if @favorite.empty?
            @favorite = Favorite.create(
            user: User.find(@user_id),
            activity: Activity.find(@activity_id)
            )
        end
        redirect_to "http://localhost:3000/showFavorites.html?id=#{@user_id}"
    end
end
