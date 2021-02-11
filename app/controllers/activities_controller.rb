class ActivitiesController < ApplicationController
    
    def index
        @activities = Activity.all
        render json: @activities
    end

    def show
        @activity = Activity.find(params[:id])
        render json: @activity
    end

    def create
        @user_id = params[:userID]
        @activity = Activity.find_by(key: params[:key])
        if !@activity
            @activity = Activity.create(
                name: params[:activity],
                accessibility: params[:accessibility],
                participants: params[:participants],
                price: params[:price],
                key: params[:key],
                activity_type: params[:type]
            )
        end
        @activity_id = @activity.id
        # redirect_to "http://localhost:9000/newFav?user_id=#{@user_id}&activity_id=${@activity_id}"
        redirect_to :controller => 'favorites', :action => 'newFav', :user_id => @user_id, :activity_id => @activity_id
    end

    def update
        @activity = Activity.find(params[:id])
        @activity.update(
            name: params[:name],
            accessibility: params[:accessibility],
            participants: params[:participants],
            price: params[:price],
            key: params[:key]
        )
        render json: @activity
    end
    
    def destroy
        @activity = Activity.find(params[:id])
        @activity.destroy
    end

    def get_activity
        type = params[:type]
        response = RestClient.get("http://www.boredapi.com/api/activity?type=#{type}")
        result = JSON.parse response
        render json: result
    end
end