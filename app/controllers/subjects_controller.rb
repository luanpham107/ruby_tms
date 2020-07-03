class SubjectsController < ApplicationController
  before_action :logged_in_user, only: %i(new create)
  before_action :is_trainer?, only: :new
  before_action :build_subject, only: :create

  def new
    @subject = Subject.new
  end

  def create
    if @subject.save
      flash[:success] = t "subjects.create.success_message"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :description, :duration)
  end

  def build_subject
    @subject = current_user.subjects.build subject_params
  end
end
