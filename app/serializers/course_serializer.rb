class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :rating, :description

  has_many :tutors, serializer: TutorSerializer
end
