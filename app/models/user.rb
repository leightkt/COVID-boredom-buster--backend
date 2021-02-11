class User < ApplicationRecord
    has_many :favorites
    has_many :activities, through: :favorites
end