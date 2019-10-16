# frozen_string_literal: true

class Admin::TutorialsController < Admin::BaseController
  def edit
    @tutorial = Tutorial.find(params[:id])
  end

  def create
     @tutorial = Tutorial.new(tutorial_params)
     if @tutorial.save
       flash[:success] = "You have created a new tutorial!"
       redirect_to tutorial_path(@tutorial)
     else
       flash[:error] = @tutorial.errors.full_messages.to_sentence
       render :new
     end
  end

  def new
    @tutorial = Tutorial.new
  end

  def update
    tutorial = Tutorial.find(params[:id])
    if tutorial.update(tutorial_params)
      flash[:success] = "#{tutorial.title} tagged!"
    end
    redirect_to edit_admin_tutorial_path(tutorial)
  end

  def destroy
    tutorial = Tutorial.find(params[:id])
    tutorial.destroy
    redirect_to admin_dashboard_path
  end

  private
  def tutorial_params
    params.require(:tutorial).permit(:tag_list, :title, :description, :thumbnail, :playlist_id, video_attributes: [:title, :description, :video_id, :thumbnail])
  end

  def video_params
    params.require(:tutorial).permit(:tag_list, :title, :description, :thumbnail)
  end

end
