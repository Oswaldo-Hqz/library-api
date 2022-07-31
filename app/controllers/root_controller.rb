class RootController < ApplicationController
    skip_before_action :require_login, only: [:index]

    def index
        render json: {
            API_name: "My U Library",            
            Author: "Oswaldo Henriqz 🤙🏽",
            Description: "API for library book control",
            Version: "1.0.0"
        }
    end

end
