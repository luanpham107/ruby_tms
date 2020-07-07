module CoursesHelper
  def statuses_generator
    Course.statuses.map{|key, _value| [key.humanize, key]}
  end
end
