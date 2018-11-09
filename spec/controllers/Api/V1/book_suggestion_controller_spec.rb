require 'rails_helper'

describe Api::V1::BookSuggestionController do
  describe 'POST #create' do
    context 'When creating a valid book suggestion' do
      let(:book_suggestion) { attributes_for(:book_suggestion) }
      it 'creates a new book suggestion' do
        expect { post :create, params: { book_suggestion: book_suggestion } }.to change(BookSuggestion, :count).by(1)
      end

      it 'responds with 201 status' do
        post :create, params: { book_suggestion: book_suggestion }
        expect(response).to have_http_status(:created)
      end
    end
  end
end
