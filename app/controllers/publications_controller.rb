class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]
  before_action :set_all, only: [:index, :show, :new, :edit, :create]
  
  #load_and_authorize_resource class:PagesController


  # GET /publications
  # GET /publications.json
  def index

    @publications = Publication.all

    @publications = @publications.by_title(params[:search_title]) if params[:search_title].present?
    
    @publications = @publications.by_type(params[:search_type]) if params[:search_type].present?

    @publications = @publications.by_region(params[:search_region]) if params[:search_region].present?

    @publications = @publications.by_commune(params[:search_commune]) if params[:search_commune].present?

    @publications = @publications.by_bedroom_min(params[:bedroom_min]) if params[:bedroom_min].present?

    @publications = @publications.by_bedroom_max(params[:bedroom_max]) if params[:bedroom_max].present?

    @publications = @publications.by_bath_min(params[:bath_min]) if params[:bath_min].present?

    @publications = @publications.by_bath_max(params[:bath_max]) if params[:bath_max].present?

    @publications = @publications.by_parking_min(params[:parking_min]) if params[:parking_min].present?

    @publications = @publications.by_parking_max(params[:parking_max]) if params[:parking_max].present?

  end

  # GET /publications/1
  # GET /publications/1.json
  def show
    @publication.page_views += 1  
    @publication.save
    @publication_attachments = @publication.publication_attachments.all
    
    @publications = Publication.all
  end

  def contact_email
    @publication = Publication.find(params[:id])
    UserMailer.contact_send(current_user, @publication, params[:name_sent], params[:phone_sent], params[:email_sent], params[:message_sent]).deliver_now()
  end

  # GET /publications/new
  def new
    @publication = Publication.new
    @publication_attachment = @publication.publication_attachments.build
    @categories = Category.all
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications
  # POST /publications.json
  def create
    @publication = current_user.publications.new(publication_params)
    equipments_ids = publication_params[:equipments_ids].delete_if{ |x| x.empty? }
    @equipments = Equipment.find(equipments_ids)
    @publication.equipments << @equipments

    #@publication.user = current_user if user_signed_in? -> Soluciona el error 'user must exist' al crear una nueva publicacion
    respond_to do |format|
      if @publication.save
        unless params[:publication_attachments].nil?
          params[:publication_attachments]['photo'].each do |a|
             @publication_attachment = @publication.publication_attachments.create!(:photo => a)
          end
        end
        format.html { redirect_to @publication, notice: 'Publication was successfully created.' }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publications/1
  # PATCH/PUT /publications/1.json
  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to @publication, notice: 'Publication was successfully updated.' }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1
  # DELETE /publications/1.json
  def destroy
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to publications_url, notice: 'Publication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

     def set_all
      @categories = Category.all
      @types = Type.all
      @regions = Region.all
      @communes = Commune.all
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publication_params
      params.require(:publication).permit(:user_id, :title, :bedroom, :bath, :parking, :description, :address, :latitude, :longitude, :price, :category_id, :type_id, :region_id, :commune_id, equipments_ids: [], publication_attachments_attributes: [:id, :publication_id, :photo, :photo_cache])
    end
end
