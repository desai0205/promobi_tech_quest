require 'rails_helper'

RSpec.describe "Api::V1::CoursesController", type: :request do
  describe 'GET #index' do
    it 'returns a success response' do
      get '/v1/courses'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_params) { { course: { name: 'Test Course', description: 'Test Description', tutors_attributes: [ { first_name: 'Test', email: 'akshay@test.com' } ] } } }

      it 'creates a new course' do
        expect {
          post '/v1/courses', params: valid_params
        }.to change(Course, :count).by(1)
      end

      it 'returns a success response with created course serialized' do
        post '/v1/courses', params: valid_params
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)).to have_key('data')
        expect(JSON.parse(response.body)['data']).to have_key('id')
        expect(JSON.parse(response.body)['data']['name']).to eq('Test Course')
        expect(JSON.parse(response.body)['data']['description']).to eq('Test Description')
        expect(JSON.parse(response.body)['data']['tutors'].first['first_name']).to eq('Test')
        expect(JSON.parse(response.body)['data']['tutors'].first['email']).to eq('akshay@test.com')
      end
    end

    context 'with invalid params' do
      let(:invalid_params) { { course: { name: nil } } }

      it 'does not create a new course' do
        expect {
          post '/v1/courses', params: invalid_params
        }.to_not change(Course, :count)
      end

      it 'returns unprocessable_entity status with error messages' do
        post '/v1/courses', params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to have_key('errors')
        expect(JSON.parse(response.body)['errors']).to include("Name can't be blank")
      end
    end
  end
end
