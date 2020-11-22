module CoursesHelper
  def course_status_class(status)
    case status
    when 'active'
      'is-success'
    when 'pending'
      'is-warning'
    when 'cancelled'
      'is-danger'
    else
      ''
    end
  end

  def display_course_dates(course)
    start_date = course.starts.strftime('%B %e')
    end_date = course.ends.strftime('%B %e')

    if start_date == end_date
      start_date
    else
      start_date + " to #{end_date}"
    end
  end
end
