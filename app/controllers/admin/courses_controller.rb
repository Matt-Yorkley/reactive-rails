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

      respond_to do |format|
        if @course.save
          format.html { redirect_to admin_courses_path, notice: 'Course was successfully created.' }
          format.json { render :show, status: :created, location: @course }
        else
          format.html { render :new }
          format.json { render json: @course.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @course.update(course_params)
          format.html { redirect_to admin_courses_path, notice: 'Course was successfully updated.' }
          format.json { render :show, status: :ok, location: @course }
        else
          format.html { render :edit }
          format.json { render json: @course.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @course.destroy
      respond_to do |format|
        format.html { redirect_to admin_courses_url, notice: 'Course was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    def bulk_update
      @courses = Course.where(id: params[:ids]).all

      respond_to do |format|
        if @courses.update_all(bulk_params.to_h)
          format.html { redirect_to admin_courses_path, notice: 'Courses successfully updated.' }
        else
          format.html { redirect_to admin_courses_path, alert: 'An error occurred whilst updating courses.' }
        end
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
