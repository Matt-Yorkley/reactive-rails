module Api
  class BaseController < ActionController::Metal
    before_action :authenticate_api_user

    private

    def authenticate_api_user
      # Placeholder
    end
  end
end
