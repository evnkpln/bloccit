class SponsoredPostsController < ApplicationController
  def show
    @topic = Topic.find(params[:topic_id])
    @sPost = SponsoredPost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @sPost = SponsoredPost.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @sPost = SponsoredPost.new
    @sPost.title = params[:sponsored_post][:title]
    @sPost.body = params[:sponsored_post][:body]
    @sPost.price = params[:sponsored_post][:price]
    @sPost.topic = @topic
    
    if @sPost.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @sPost]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end
  
  def edit
    @sPost = SponsoredPost.find(params[:id])
  end
  
  def update
    @sPost = SponsoredPost.find(params[:id])
    
    @sPost.title = params[:sponsored_post][:title]
    @sPost.body = params[:sponsored_post][:body]
    @sPost.price = params[:sponsored_post][:price]
    
    if @sPost.save
      flash[:notice] = "Post was updated."
      redirect_to [@sPost.topic, @sPost]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :edit
    end
  end
  
  def destroy
    @sPost = SponsoredPost.find(params[:id])
    
    if @sPost.destroy
      flash[:notice] = "\"#{@sPost.title}\" was deleted successfully"
      redirect_to @sPost.topic
    else
      flash.now[:alert] = "there was an error deleting the post."
      render :show
    end
  end
  
end
