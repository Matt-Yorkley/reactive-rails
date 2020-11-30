module Admin
  class BaseController < ApplicationController
    include AuthorizeResource

    layout 'admin/application'
    before_action :authorize_admin

    private

    def authorize_admin
      #redirect_to root_path unless current_user&.admin
    end
  end
end
