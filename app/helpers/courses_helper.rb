module CoursesHelper
  def statuses_generator
    Course.statuses.map{|key, _value| [Course.human_enum_name(:status, key), key]}
  end

  def subject_detail_statuses_generator
    CourseDetail.statuses.map{|key, _value| [CourseDetail.human_enum_name(:status, key), key]}
  end

  def statuses_generator_subject
    UserSubject.statuses.map{|key, _value| [UserSubject.human_enum_name(:status, key), key]}
  end
end
