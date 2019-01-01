require 'rails_helper'

describe "Link API", type: :request do
  before do
    20.times do
      create(:link, :valid_url)
    end
  end

  describe '#index' do
    it 'can grab 10 links' do
      get api_v1_links_path
      json = JSON.parse(response.body)
      expect(response).to have_http_status :successful
      expect(json.size).to eq 10
    end
  end

  describe '#show' do
    let(:link) { create(:link, :valid_url) }
    context 'link that exist' do
      it 'can grab short_id' do
        get api_v1_link_path link.id
        expect(response).to match_json_schema('link')
      end
    end
  end

  describe '#link_url' do
    let(:link) { build(:link, :valid_url) }
    context 'link that not exist' do
      it 'can grab short_id' do
        expect {
          post api_v1_links_create_path url: link.url
        }.to change { Link.count }.by(1)
        expect(Link.last.generated).to eq 1
        expect(response).to match_json_schema('link')

      end
    end
  end
end