class CoursesController < ApplicationController
  before_action :logged_in_user, only: %i(new create)
  before_action :is_trainer?, only: %i(new create)
  before_action :build_course, only: :create

  def new
    @course = Course.new
  end

  def create
    if @course.save
      flash[:success] = t "course.create.success_message"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :description)
  end

  def build_course
    @course = current_user.courses.build course_params
  end
end
