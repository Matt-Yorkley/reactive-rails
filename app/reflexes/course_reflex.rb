# frozen_string_literal: true

class CourseReflex < ApplicationReflex
  before_reflex :authorize_resource!, only: [:bulk_update]

  def bulk_update
    return flash[:alert] = 'Not updated; no courses were selected.' if params[:ids].blank?

    @courses = Course.where(id: params[:ids]).all

    if @courses.update_all(bulk_params.to_h)
      flash[:notice] = 'Courses successfully updated.'
    else
      flash[:alert] = 'An error occurred whilst updating courses.'
    end
  end

  private

  def bulk_params
    params.require(:course).permit(:status)
  end
end
