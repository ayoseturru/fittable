class PublicationAttachmentsController < ApplicationController
  before_action :set_publication_attachment, only: [:show, :edit, :update, :destroy]

  # GET /publication_attachments
  # GET /publication_attachments.json
  def index
    @publication_attachments = PublicationAttachment.all
  end

  # GET /publication_attachments/1
  # GET /publication_attachments/1.json
  def show
  end

  # GET /publication_attachments/new
  def new
    @publication_attachment = PublicationAttachment.new
  end

  # GET /publication_attachments/1/edit
  def edit
  end

  # POST /publication_attachments
  # POST /publication_attachments.json
  def create
    @publication_attachment = PublicationAttachment.new(publication_attachment_params)

    respond_to do |format|
      if @publication_attachment.save
        format.html { redirect_to @publication_attachment, notice: 'Publication attachment was successfully created.' }
        format.json { render :show, status: :created, location: @publication_attachment }
      else
        format.html { render :new }
        format.json { render json: @publication_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publication_attachments/1
  # PATCH/PUT /publication_attachments/1.json
  def update
    respond_to do |format|
      if @publication_attachment.update(publication_attachment_params)
        format.html { redirect_to @publication_attachment.publication, notice: 'Post attachment was successfully updated.' }
      end
    end
  end

  # DELETE /publication_attachments/1
  # DELETE /publication_attachments/1.json
  def destroy
    @publication_attachment.destroy
    respond_to do |format|
      format.html { redirect_to @publication_attachment.publication, notice: 'Publication attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_publication_attachment
    @publication_attachment = PublicationAttachment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def publication_attachment_params
    params.require(:publication_attachment).permit(:image, :publication_id)
  end
end
