module CoursesHelper
  def statuses_generator
    Course.statuses.map{|key, _value| [Course.human_enum_name(:status, key), key]}
  end
end
