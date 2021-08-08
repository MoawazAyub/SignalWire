require 'rails_helper'

RSpec.describe Api::TagsController, type: :controller do
  context 'Create' do
    describe 'valid params' do
      let(:params) do
        {
          user_id: 1,
          title: 'new title',
          tags: ['tag1', 'tag2']
        }
      end
      before do
        post :create, params: params, as: :json
      end

      it 'should be successful' do
        expect(response.status).to eq(200)
      end

      it 'it should increment number of tickets' do
        expect { post :create, params: params, as: :json }.to change { Ticket.count }
      end

      it 'it should create tags' do
        expect(Tag.count).to eq(2)
      end
    end

     describe 'invalid params' do
      let(:params) do
        {
          title: 'new title',
          tags: ['tag1', 'tag2']
        }
      end
      before do
        post :create, params: params, as: :json
      end

      it 'should be successful' do
        expect(response.status).to eq(422)
      end

      it 'it should show error message' do
        expect(JSON.parse(response.body)).to eq(
          { "error"=>{"user_id"=>["can't be blank", "is not a number"]} }
        )
      end
    end
  end
end
