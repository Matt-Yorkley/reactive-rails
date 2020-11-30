# frozen_string_literal: true

class CourseReflex < ApplicationReflex
  include Rest::Courses

  before_reflex :authorize_resource!, only: [:bulk_update]

  def bulk_update
    return flash[:alert] = 'Not updated; no courses were selected.' if params[:ids].blank?

    if bulk_update_course
      flash[:notice] = 'Courses successfully updated.'
    else
      flash[:alert] = 'An error occurred whilst updating courses.'
    end
  end
end
