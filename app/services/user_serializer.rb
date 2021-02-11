class UserSerializer

    def initialize(user_object, search = nil)
        @user = user_object
        @favorites = []
    end

    def to_serialized_json
        extractFavorites
        user_data = {}
        user_data[:user] = @user
        user_data[:favorites] = @favorites
        user_data.to_json
    end

    def extractFavorites
        @user.favorites.map do |favorite|
            newfav = favorite.as_json
            activity = favorite.activity.as_json
            activity["activity_type"] = activity["activity_type"].capitalize
            activity["accessibility"] = updateAccessibility(activity)
            activity["price"] = updatePrice(activity)
            newfav["activity"] = activity
            @favorites << newfav
        end
    end

    def updateAccessibility(activity)
        access = activity["accessibility"]
        if access == 0
            access = "Accessible to Most"
        elsif access > 0.0 && access < 0.6
            access = "Somewhat Accessible"
        else 
            access = "Limited Accessibility"
        end
    end

    def updatePrice(activity)
        price = activity["price"]
        if price == 0
            price = "Free"
        elsif price > 0.0 && price < 0.3
            price = "Cheap"
        elsif price > 0.3 && price < 0.6
            price = "Moderate"
        else 
            price = "Expensive"
        end
    end


end