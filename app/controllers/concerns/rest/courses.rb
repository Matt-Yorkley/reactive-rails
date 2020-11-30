# Refactoring experiment with namespaced api controllers, admin controllers, and reflexes.
# The business logic of the actions can be defined once and shared across all three contexts.

module Rest
  module Courses
    extend ActiveSupport::Concern

    def index_course
      @q = Course.order(:created_at).ransack(params[:q])
      @pagy, @courses = pagy(@q.result, items: 6, page: @page)
    end

    def create_course
      @course = Course.new(course_params)
      @course.save
    end

    def update_course
      @course.update(course_params)
    end

    def destroy_course
      @course.destroy
    end

    def bulk_update_course
      @courses = Course.where(id: params[:ids]).all
      @courses.update_all(bulk_params.to_h)
    end

    private

    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(
        :title, :tutor, :description, :starts, :ends, :status, :public, :subscription_id
      )
    end

    def bulk_params
      params.require(:course).permit(:status)
    end
  end
end
