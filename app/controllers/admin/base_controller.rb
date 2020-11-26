module Admin
  class BaseController < ApplicationController
    layout 'admin/application'
    before_action :authorize_admin

    private

    def admin_controller?
      true
    end

    def authorize_admin
      #redirect_to root_path unless current_user&.admin
    end
  end
end
