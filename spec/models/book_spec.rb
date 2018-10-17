require 'rails_helper'
require 'faker'

describe Book, type: :model do
  it do
    is_expected.to validate_presence_of(:genre)
  end
  it do
    is_expected.to validate_presence_of(:author)
  end
  it do
    is_expected.to validate_presence_of(:title)
  end
  it do
    is_expected.to validate_presence_of(:publisher)
  end
  it do
    is_expected.to validate_presence_of(:year)
  end

  subject(:Book) do
    Book.new(
      genre: genre, author: author, image: image, title: title,
      publisher: publisher, year: year
    )
  end

  let(:genero)  { Faker::Book.genre }
  let(:autor)   { Faker::Book.author }
  let(:image)   { 'imagen.png' }
  let(:titulo)  { Faker::Book.title }
  let(:editor)  { Faker::Book.publisher }
  let(:anio)    { Time.now.in_time_zone }

  describe '#create' do
    context 'When the genre is nil' do
      let(:genre) { nil }

      it do
        is_expected.to be_invalid
      end
    end

    context 'When the author is nil' do
      let(:author) { nil }

      it do
        is_expected.to be_invalid
      end
    end
    context 'When the image is nil' do
      let(:image) { nil }

      it do
        is_expected.to be_invalid
      end
    end
    context 'When the title is nil' do
      let(:title) { nil }

      it do
        is_expected.to be_invalid
      end
    end
    context 'When the publisher is nil' do
      let(:publisher) { nil }

      it do
        is_expected.to be_invalid
      end
    end
    context 'When the year is nil' do
      let(:year) { nil }

      it do
        is_expected.to be_invalid
      end
    end
  end
end
