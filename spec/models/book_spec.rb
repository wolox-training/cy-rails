require 'rails_helper'
require 'faker'

describe Book, type: :model do
  it do
    is_expected.to validate_presence_of(:genero)
  end
  it do
    is_expected.to validate_presence_of(:autor)
  end
  it do
    is_expected.to validate_presence_of(:image)
  end
  it do
    is_expected.to validate_presence_of(:titulo)
  end
  it do
    is_expected.to validate_presence_of(:editor)
  end
  it do
    is_expected.to validate_presence_of(:anio)
  end

  subject(:Book) do
    Book.new(
      genero: genero, autor: autor, image: image, titulo: titulo,
      editor: editor, anio: anio
    )
  end

  let(:genero)  { Faker::Book.genre }
  let(:autor)   { Faker::Book.author }
  let(:image)   { 'imagen.png' }
  let(:titulo)  { Faker::Book.title }
  let(:editor)  { Faker::Book.publisher }
  let(:anio)    { Time.now.in_time_zone }

  describe '#create' do
    context 'When the genero is nil' do
      let(:genero) { nil }

      it do
        is_expected.to be_invalid
      end
    end

    context 'When the autor is nil' do
      let(:autor) { nil }

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
    context 'When the titulo is nil' do
      let(:titulo) { nil }

      it do
        is_expected.to be_invalid
      end
    end
    context 'When the editor is nil' do
      let(:editor) { nil }

      it do
        is_expected.to be_invalid
      end
    end
    context 'When the anio is nil' do
      let(:anio) { nil }

      it do
        is_expected.to be_invalid
      end
    end
  end
end
