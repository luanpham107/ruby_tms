class SubjectsController < ApplicationController
  before_action :logged_in_user
  before_action :is_trainer?
  before_action :build_subject, only: :create
  before_action :load_subject, only: %i(show edit update)

  def new
    @subject = Subject.new
  end

  def show; end

  def create
    if @subject.save
      flash[:success] = t "subjects.create.success_message"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @subject.update subject_params
      flash[:success] = t ".success"
      redirect_to @subject
    else
      render :edit
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :description, :duration)
  end

  def build_subject
    @subject = current_user.subjects.build subject_params
  end

  def load_subject
    @subject = Subject.find_by id: params[:id]
    return if @subject

    flash[:warning] = t ".not_found"
    redirect_to root_path
  end
end
