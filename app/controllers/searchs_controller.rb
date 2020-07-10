class SearchsController < ApplicationController
  before_action :logged_in_user
  before_action :load_course, only: :search_user_by_name

  def search_user_by_name
    @search_users = User.search(params[:name], @course.users.ids)
  end

  private

  def load_course
    @course = Course.find_by id: params[:course_id]
    return if @course

    flash[:warning] = t "courses.load_course.not_found"
    redirect_to root_path
  end
end
