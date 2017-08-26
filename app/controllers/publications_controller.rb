class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]

  # GET /publications
  # GET /publications.json
  def index
    @publications = Publication.all
    @communes = Commune.all
  end

  # GET /publications/1
  # GET /publications/1.json
  def show
    @communes = Commune.all
  end

  # GET /publications/new
  def new
    @publication = Publication.new
    @categories = Category.all
    @types = Type.all
    @communes = Commune.all
    @regions = Region.all
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications
  # POST /publications.json
  def create





    @publication = Publication.new(publication_params)

    @publication.user = current_user
    equipments_ids = publication_params[:equipments_ids].delete_if{ |x| x.empty? }
    @equipment = Equipment.find(equipments_ids)
    @publication.equipments << @equipments

    #@publication.user = current_user if user_signed_in? -> Soluciona el error 'user must exist' al crear una nueva publicacion
    respond_to do |format|
      if @publication.save
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
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publication_params
      params.require(:publication).permit(:title, :bedroom, :bath, :parking, :equipment, :description, :price, :category_id, :type_id, :region_id, :commune_id, equipments_ids: [])
    end
end
