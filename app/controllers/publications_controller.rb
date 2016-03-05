class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show]

  def new
    @publication = Publication.new
    @publication_attachment = @publication.publication_attachments.build
  end

  def create
    @publication = Publication.new(publication_params)

    respond_to do |format|
      if @publication.save
        params[:publication_attachments]['image'].each do |img|
          @publication_attachment = @publication.publication_attachments.create!(:image => img)
        end
        format.html { redirect_to @publication, notice: 'Se añadió el ejercicio correctamente' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def show
    @publication_attachments = @publication.publication_attachments.all
  end

  private
  def publication_params
    params.require(:publication).permit(:title, :description, :category, publication_attachments_attributes: [:id, :publication_id, :image])
  end

  def set_publication
    @publication = Publication.find_by_id(params[:id])
  end


end
