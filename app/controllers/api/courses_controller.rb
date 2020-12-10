module Api
  class CoursesController < Admin::BaseController
    include Rest::Courses

    before_action :set_course, only: [:show, :update, :destroy]

    def index
      index_course

      render json: { data: @courses, pagination: pagination_data }, status: :ok
    end

    def show
      render json: @course
    end

    def create
      if create_course
        render json: @course, status: :ok
      else
        render json: { errors: @course.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def update
      if update_course
        render json: @course, status: :ok
      else
        render json: { errors: @course.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      destroy_course

      render json: {}, status: :ok
    end

    def bulk_update
      if bulk_update_course
        render json: {}, status: :ok
      else
        render json: { errors: 'An error occurred whilst updating courses.' }, status: :unprocessable_entity
      end
    end

    private

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
