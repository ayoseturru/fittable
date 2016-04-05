class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy, :like, :dislike]
  before_action :authenticate
  after_action :update_manifiest, only: [:edit, :create, :update, :destroy]

  def new
    @publication = Publication.new
    @publication_attachment = @publication.publication_attachments.build
  end

  def edit
    @publication_attachment = @publication.publication_attachments
  end

  def search

  end

  def main
    redirect_to exercises_url
  end

  def user_publications
    @publications = current_user.publications
  end

  def like
    Like.create(user_id: current_user.id, publication_id: @publication.id)
    @publication.update(like: @publication.like + 1)
    respond_to do |format|
      format.js
    end
  end

  def dislike
    Like.user_like(current_user.id, @publication.id).first.delete
    @publication.update(like: @publication.like - 1)
    respond_to do |format|
      format.js
    end
  end

  def index
    @publications = Publication.all
  end

  def search_by_category
    @publications = Publication.category(params[:category] != "" ? params[:category] : "General")
    respond_to do |format|
      format.html { render action: :index }
      format.js
    end
  end

  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to @publication, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to main_publications_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create
    @publication = current_user.publications.new(publication_params)

    respond_to do |format|
      if @publication.save
        for i in 0..2
          if params[:publication_attachments]['image'][i]
            @publication_attachment = @publication.publication_attachments.create!(:image => params[:publication_attachments]['image'][i])
          else
            @publication_attachment = @publication.publication_attachments.create!(:image => params[:publication_attachments]['image'][i])
          end
        end
        format.html { redirect_to @publication, notice: 'Se añadió el ejercicio correctamente' }
      else
        flash[:notice] = "Asegúrese de haber añadido una categoría"
        format.html { render action: 'new' }
      end
    end
  end

  def show
    @publication_attachments = @publication.publication_attachments.all
  end

  private
  def publication_params
    params.require(:publication).permit(:user_id, :title, :description, :category, publication_attachments_attributes: [:id, :publication_id, :image])
  end

  def set_publication
    @publication = Publication.find_by_id(params[:id])
  end


end
