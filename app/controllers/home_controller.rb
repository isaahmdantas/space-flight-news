class HomeController < ApplicationController

    def index 
        render json: {body: "Back-end Challenge 2021 🏅 - Space Flight News"}, status: :ok 
    end

end