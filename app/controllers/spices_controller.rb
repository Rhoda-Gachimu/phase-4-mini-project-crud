class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :spice_not_found

  # GET /spices
  def index
    spices = Spice.all
    render json: spices
  end
  # POST /spices
  def create
    spice = Spice.create(spice_params)

    render json: spice, status: :created
  end

  # PATCH /spices/:id
  def update
    spice = find_spice
    spice.update(spice_params)
    render json: spice
 
  # rescue ActiveRecord::RecordNotFound
  #   spice_not_found
  end

  # DELETE /spices/:id
  def destroy
    spice = find_spice
    spice.destroy
    head :no_content
  
  # rescue ActiveRecord::RecordNotFound
  #   spice_not_found
  end


  private
  def find_spice
    Spice.find(params[:id])
  end
  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end
  def spice_not_found
    render json: { error: "Spice not found" }
  end
end
