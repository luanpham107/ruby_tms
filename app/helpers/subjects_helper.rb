module SubjectsHelper
  def new_action?
    current_page?(action: :new)
  end
end
