class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]
  before_action :set_all, only: [:index, :show, :new, :edit, :create]
  
  #load_and_authorize_resource class:PagesController


  # GET /publications
  # GET /publications.json
  def index

    @publications = Publication.all

    #if params[:search_title].present?
    #  @publications = Publication.where("title ilike ? OR description ilike ?", "%#{params[:search_title]}%", 
    #    "%#{params[:search_title]}%")
    # elsif params[:search_type].present? || params[:search_region].present? || params[:search_commune].present?
    #  @publications = Publication.where(type_id: params[:search_type], region_id: params[:search_region], 
    #    commune_id: params[:search_commune])
    #else
    #  @publications = Publication.all
    #end

    if params[:search_title].present?
      @publications = @publications.where("title ilike ? OR description ilike ?", "%#{params[:search_title]}%", 
        "%#{params[:search_title]}%")
    end

    if params[:search_type].present? 
      @publications = @publications.where(type_id: params[:search_type])
    end

    if params[:search_region].present?
       @publications = @publications.where(region_id: params[:search_region])
    end

    if params[:search_commune].present?
       @publications = @publications.where(commune_id: params[:search_commune])
    end

    if params[:bedroom_min].present?
      @publications = @publications.where("bedroom >= ?", params[:bedroom_min])
    end

    if params[:bedroom_max].present?
      @publications = @publications.where("bedroom <= ?", params[:bedroom_max])
    end

    if params[:bath_min].present?
      @publications = @publications.where("bath >= ?", params[:bath_min])
    end

    if params[:bath_max].present?
      @publications = @publications.where("bath <= ?", params[:bath_max])
    end

    if params[:parking_min].present?
      @publications = @publications.where("parking >= ?", params[:parking_min])
    end

    if params[:parking_max].present?
      @publications = @publications.where("parking <= ?", params[:parking_max])
    end
    
  end

  # GET /publications/1
  # GET /publications/1.json
  def show
    @publication.page_views += 1
    @publication.save
    @publication_attachments = @publication.publication_attachments.all
  end

  # GET /publications/new
  def new
    @publication = Publication.new
    @publication_attachment = @publication.publication_attachments.build
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
        params[:publication_attachments]['photo'].each do |a|
           @publication_attachment = @publication.publication_attachments.create!(:photo => a)
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
      params.require(:publication).permit(:user_id, :title, :bedroom, :bath, :parking, :description, :price, :category_id, :type_id, :region_id, :commune_id, equipments_ids: [], publication_attachments_attributes: [:id, :publication_id, :photo, :photo_cache])
    end
end
