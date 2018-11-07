require 'rails_helper'

describe Api::V1::BookSuggestionController do
  describe 'POST #create' do
    context 'When creating a valid book suggestion' do
      subject(:user) { create(:user) }
      subject(:book_suggestion_new) { build(:book_suggestion, user: user) }
      let(:book_suggestion_param) do
        {
          book_suggestion: book_suggestion_new.attributes
        }
      end
      it 'creates a new book suggestion' do
        expect { post :create, params: book_suggestion_param }.to change(BookSuggestion, :count).by(1)
      end

      it 'responds with 201 status' do
        post :create, params: book_suggestion_param
        expect(response).to have_http_status(:created)
      end
    end
  end
end
