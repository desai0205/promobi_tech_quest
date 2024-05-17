require 'rails_helper'

RSpec.describe Tutor, type: :model do
  describe "it should validation presence of first_name" do
    it { should validate_presence_of(:first_name) }
  end

  describe "it should validate email" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe "it should validate email with specifix format" do
    it do
      should allow_value('valid@example.com').for(:email)
      should_not allow_value('invalid.com').for(:email)
    end
  end

  describe "associations" do
    it { should belong_to(:course) }
  end
end
