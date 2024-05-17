class Api::V1::CoursesController < ApplicationController
  def index
    courses = Course.includes(:tutors).paginate(page: params[:page], per_page: 10)
    render json: {
      data: courses.map { |course| CourseSerializer.new(course) },
      meta: pagination_meta(courses)
    }
  end

  def create
    course = Course.new(course_params)
    if course.save
      render json: { data: CourseSerializer.new(course) }, status: :created
    else
      render json: { errors: course.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :rating, :description, tutors_attributes: [:last_name, :first_name, :email])
  end

  def pagination_meta(courses)
    {
      current_page: courses.current_page,
      next_page: courses.next_page,
      previous_page: courses.previous_page,
      total_pages: courses.total_pages,
      total_entries: courses.total_entries
    }
  end
end
