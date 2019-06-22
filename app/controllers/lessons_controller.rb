class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson, only: [:show]



  def show

  end

  private

  def require_authorized_for_current_lesson
    if !current_user.enrolled_in?(current_lesson.section.course) 
      redirect_to course_path(current_lesson.section.course), alert: 'Please Enroll in course before viewing lesson'
    end
  end

  # def enrolled_in?(course)
  #   enrolled_courses = []
  #   enrollments.each do |enrollment|
  #     enrolled_courses << enrollment.course
  #   end
  #   return enrolled_courses.include?(course)
  # end

  

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

end
