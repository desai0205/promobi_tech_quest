require 'rails_helper'

RSpec.describe Course, type: :model do
  describe "validate the uniqueness of name" do
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe "associations" do
    it { should have_many(:tutors) }
  end

  describe "nested attributes" do
    it { should accept_nested_attributes_for(:tutors) }
  end
end
