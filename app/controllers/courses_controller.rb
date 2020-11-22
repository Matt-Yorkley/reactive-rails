class CoursesController < ApplicationController
  before_action :set_course, only: :show

  def index
    @q = Course.visible.ransack(params[:q])
    @courses = @q.result
  end

  def show
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end
end
