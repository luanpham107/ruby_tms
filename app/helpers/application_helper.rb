module ApplicationHelper
  def full_title page_title
    base_title = I18n.t "application._helper.base_title"
    page_title.blank? ? base_title : "#{page_title} | #{base_title}"
  end

  def sub_task_field form
    sub_address = form.object.tasks.build
    form.fields_for :tasks, sub_address, child_index: "index" do |ff|
      render "task_fields", f: ff
    end
  end
end
