class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]
  before_action :authenticate


  def new
    @publication = Publication.new
    @publication_attachment = @publication.publication_attachments.build
  end

  def edit
    @publication_attachment = @publication.publication_attachments
  end

  def search

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
      format.html { redirect_to @publication, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create
    @publication = current_user.publications.new(publication_params)

    respond_to do |format|
      if @publication.save
        if params[:publication_attachments]['image']
          params[:publication_attachments]['image'].each do |img|
            @publication_attachment = @publication.publication_attachments.create!(:image => img)
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
