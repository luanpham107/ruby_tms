class CoursesController < ApplicationController
  before_action :logged_in_user
  before_action :load_course, only: :show

  def show
    @users = @course.users.search_by_name_role.paginate(page: params[:user_page],
      per_page: Settings.course.show.paginate.member)
    @added_subjects = @course.subjects.newest
  end

  private

  def load_course
    @course = Course.find_by id: params[:id]
    return if @course

    flash[:warning] = t "courses.load_course.not_found"
    redirect_to root_path
  end
end
