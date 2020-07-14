class Admin::CourseDetailsController < ApplicationController
  before_action :logged_in_user
  before_action :is_trainer?, :load_course, :load_existing_subjects, only: :create

  def create
    CourseDetail.transaction do
      @will_save_subject_ids.each do |sid|
        CourseDetail.create! status: CourseDetail.statuses[:pending], course_id: params[:course_id], subject_id: sid
      end

      @added_subjects = @course.subjects.newest
    rescue
      flash.now[:warning] = t "admin.courses.add_existing_subject.warning"
      redirect_to root_path
    end
  end

  private

  def load_course
    @course = Course.find_by id: params[:course_id]
    return if @course

    flash[:warning] = t "admin.courses.load_course.not_found"
    redirect_to root_path
  end

  def load_existing_subjects
    @will_save_subject_ids = (Subject.search_by_ids params[:subject_ids]).pluck(:id)
    return if @will_save_subject_ids.present?

    flash[:warning] = t "admin.courses.load_existing_subjects.not_found"
    redirect_to [:admin, @course]
  end
end
