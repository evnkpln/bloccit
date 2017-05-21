require 'rails_helper'

RSpec.describe Post, type: :model do
  
  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }
  let(:price) { rand(100) }
  let(:topic) { Topic.create!(name: name, description: description) }
  let(:s_post) { topic.sponsored_posts.create!(title: title, body: body, price: price) }
  
  it { is_expected.to belong_to(:topic) }
  
  describe "attributes" do
      it "has title, body, and price attributes" do
          expect(s_post).to have_attributes(title: title, body: body, price: price)
      end
  end
end
