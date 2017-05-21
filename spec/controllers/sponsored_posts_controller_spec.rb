require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do

  let(:my_topic) {Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:my_sPost) { my_topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(100)) }
  
  describe "GET #show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: my_sPost.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders the show view" do
      get :show, topic_id: my_topic.id, id: my_sPost.id
      expect(response).to render_template :show
    end
    
    it "assigns my_sPost to @sPost" do
      get :show, topic_id: my_topic.id, id: my_sPost.id
      expect(assigns(:sPost)).to eq my_sPost
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, topic_id: my_topic.id, id: my_sPost.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders the new view" do
      get :new, topic_id: my_topic.id, id: my_sPost.id
      expect(response).to render_template :new
    end
    
    it "instatiates a new sponsored post" do
      get :new, topic_id: my_topic.id, id: my_sPost.id
      expect(assigns(:sPost)).not_to be_nil
    end
  end
  
  describe "POST create" do
    it "increases sPosts by 1" do
      expect{post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(5000)}}.to change(SponsoredPost,:count).by(1)
    end
    
    it "assigns the new post to @post" do
      post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(5000)}
      expect(assigns(:sPost)).to eq SponsoredPost.last
    end
    
    it "redirects to the new post" do
      post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(5000)}
      expect(response).to redirect_to [my_topic, SponsoredPost.last]
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, topic_id: my_topic.id, id: my_sPost.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders the edit view" do
      get :edit, topic_id: my_topic.id, id: my_sPost.id
      expect(response).to render_template(:edit)
    end
    
    it "loads selected post to @sPost" do
      get :edit, topic_id: my_topic.id, id: my_sPost.id
      
      sPost_instance = assigns(:sPost)
      
      expect(sPost_instance.id).to eq my_sPost.id
      expect(sPost_instance.title).to eq my_sPost.title
      expect(sPost_instance.body).to eq my_sPost.body
    end
  end
  
  describe "PUT update" do
    it "updates the sponsored post" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      new_price = rand(5000)
      
      put :update, topic_id: my_topic.id, id: my_sPost.id, sponsored_post: {title: new_title, body: new_body, price: new_price }
      updated_spost = assigns(:sPost)
      expect(updated_spost.title).to eq new_title
      expect(updated_spost.body).to eq new_body
      expect(updated_spost.price).to eq new_price
    end
    
    it "redirects to the post" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      new_price = rand(5000)
      
      put :update, topic_id: my_topic.id, id: my_sPost.id, sponsored_post: {title: new_title, body: new_body, price: new_price }
      expect(response).to redirect_to [my_topic, my_sPost]
    end
  end
  
  describe "DELETE destroy" do
    it "deletes the post" do
      delete :destroy, topic_id: my_topic.id, id: my_sPost.id
      count = SponsoredPost.where({id: my_sPost.id}).size
      expect(count).to eq 0
    end
    
    it "redirects to topic show" do
      delete :destroy, topic_id: my_topic.id, id: my_sPost.id
      expect(response).to redirect_to my_topic
    end
  end

end
