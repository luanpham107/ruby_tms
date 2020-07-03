class UserSubjectsController < ApplicationController
  before_action :logged_in_user
  before_action :load_course, :check_status_closed_course, :check_exist_of_subject_within_course,
    :check_status_closed_subject, :load_task_ids, only: :create

  def create
    ActiveRecord::Base.transaction do
      current_user.user_subjects.create! subject_id: @course_detail.subject_id
      @task_ids.each do |id|
        current_user.process_tasks.create! task_id: id
      end
      flash[:success] = t ".start_success"
      redirect_to @course
    end
  rescue
    flash.now[:warning] = t ".start_failed"
    redirect_to @course
  end

  private

  def load_course
    @course = Course.find_by id: params[:user_subject][:course_id]
    return if @course

    flash[:warning] = t "courses.load_course.not_found"
    redirect_to @course
  end

  def check_exist_of_subject_within_course
    @course_detail = CourseDetail.find_by course_id: params[:user_subject][:course_id],
      subject_id:  params[:user_subject][:subject_id]
    return if @course_detail

    flash[:warning] = t "user_subjects.load_subject_within_course.not_found"
    redirect_to @course
  end

  def check_status_closed_course
    return unless @course.closed?

    flash[:warning] = t ".close_course"
    redirect_to @course
  end

  def check_status_closed_subject
    return unless @course_detail.finished?

    flash[:warning] = t ".finished_subject"
    redirect_to @course
  end

  def load_task_ids
    @task_ids = Subject.find_by(id: @course_detail.subject_id).tasks.ids
  end
end
