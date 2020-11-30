module Api
  class CoursesController < Admin::BaseController
    before_action :set_course, only: [:show, :update, :destroy]

    def index
      @q = Course.order(:created_at).ransack(params[:q])
      @pagy, @courses = pagy(@q.result, items: 6, page: @page)

      render json: { data: @courses, pagination: pagination_data }, status: :ok
    end

    def show
      render json: @course
    end

    def create
      @course = Course.new(course_params)

      if @course.save
        render json: @course, status: :ok
      else
        render json: { errors: @course.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def update
      if @course.update(course_params)
        render json: @course, status: :ok
      else
        render json: { errors: @course.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      @course.destroy

      render json: {}, status: :ok
    end

    def bulk_update
      @courses = Course.where(id: params[:ids]).all

      if @courses.update_all(bulk_params.to_h)
        render json: {}, status: :ok
      else
        render json: { errors: 'An error occurred whilst updating courses.' }, status: :unprocessable_entity
      end
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

    def pagination_data
      {
        count: @pagy.count,
        page: @pagy.page,
        pages: @pagy.pages,
        per_page: @pagy.items
      }
    end
  end
end
