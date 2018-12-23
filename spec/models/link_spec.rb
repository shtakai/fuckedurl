require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:valid_link) { create(:link, :valid_url) }
  let(:invalid_link) { build(:link, :invalid_url) }

  describe 'convert url to short url' do
    context 'normal url' do
      it 'has 0 redirect' do
        expect(valid_link.redirect).to eq 0
      end

      it 'converts w/10 letters' do
        expect(valid_link.short_id).to match /\w{10}/
      end
    end

    context 'invalid url' do
      it 'cannot create link' do
        expect(invalid_link).to be_invalid
        expect(invalid_link.save).to eq false
      end
    end

    context 'already set same url' do
      it 'cannot create link' do
        link = Link.new(url: valid_link.url)
        expect(link).to be_invalid
        expect(link.save).to be false
      end
    end
  end

  describe 'track short id to url' do
    context 'short id is exist on Link model' do
      it 'can find Link' do
        expect(Link.find_by short_id: valid_link.short_id).to eq valid_link
      end
    end

    context 'short id is not exist on Link model' do
      it 'can\'t find Link' do
        begin
          id = Array.new(10) { Faker::Types.character }.join
        end while valid_link.short_id == id

        expect(Link.find_by short_id: id).to be_nil
      end
    end
  end

end
