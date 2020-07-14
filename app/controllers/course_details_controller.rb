class CourseDetailsController < ApplicationController
  before_action :logged_in_user
  before_action :is_trainer?, :load_course, only: :create

  def create
    subjects_id = params[:subjects_id]
    CourseDetail.transaction do
      subjects_id.each do |sid|
        CourseDetail.create! status: CourseDetail.statuses[:pending], course_id: params[:course_id], subject_id: sid
      end

      @added_subjects = @course.subjects.newest
    rescue
      flash.now[:warning] = t "courses.add_existing_subject.warning"
      redirect_to root_path
    end
  end

  private

  def load_course
    @course = Course.find_by id: params[:course_id]
    return if @course

    flash[:warning] = t "courses.load_course.not_found"
    redirect_to root_path
  end
end
