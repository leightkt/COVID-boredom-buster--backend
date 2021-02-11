class LoadsController < ApplicationController

    def loading
        render json: {message: "ready"}
    end
end
