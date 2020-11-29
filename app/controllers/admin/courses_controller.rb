module Admin
  class CoursesController < Admin::BaseController
    before_action :set_course, only: [:show, :edit, :update, :destroy]

    def index
      @q = Course.order(:created_at).ransack(params[:q])
      @pagy, @courses = pagy(@q.result, items: 6)
    end

    def show
    end

    def new
      @course = Course.new
    end

    def edit
    end

    def create
      @course = Course.new(course_params)

      if @course.save
        redirect_to admin_courses_path, notice: 'Course was successfully created.'
      else
        render :new
      end
    end

    def update
      if @course.update(course_params)
        redirect_to admin_courses_path, notice: 'Course was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @course.destroy

      redirect_to admin_courses_url, notice: 'Course was successfully destroyed.'
    end

    def bulk_update
      @courses = Course.where(id: params[:ids]).all

      if @courses.update_all(bulk_params.to_h)
        redirect_to admin_courses_path, notice: 'Courses successfully updated.'
      else
        redirect_to admin_courses_path, alert: 'An error occurred whilst updating courses.'
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
  end
end
