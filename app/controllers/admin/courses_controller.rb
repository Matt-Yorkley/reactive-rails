module Admin
  class CoursesController < Admin::BaseController
    include Rest::Courses

    before_action :set_course, only: [:show, :edit, :update, :destroy]

    def index
      index_course
    end

    def show
    end

    def new
      @course = Course.new
    end

    def edit
    end

    def create
      if create_course
        redirect_to admin_courses_path, notice: 'Course was successfully created.'
      else
        render :new
      end
    end

    def update
      if update_course
        redirect_to admin_courses_path, notice: 'Course was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      destroy_course

      redirect_to admin_courses_url, notice: 'Course was successfully destroyed.'
    end

    def bulk_update
      if bulk_update_course
        redirect_to admin_courses_path, notice: 'Courses successfully updated.'
      else
        redirect_to admin_courses_path, alert: 'An error occurred whilst updating courses.'
      end
    end
  end
end
