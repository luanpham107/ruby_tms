module TasksHelper
  def check_exist_in_process_task task
    task.process_tasks.find_by user_id: current_user.id
  end

  def get_status_process_task task
    task.process_tasks.find_by(user_id: current_user.id).status
  end

  def statuses_generator_status
    ProcessTask.statuses.map{|key, _value| [ProcessTask.human_enum_name(:status, key), key]}
  end
end
