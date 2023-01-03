class SitemsController < ApplicationController
  before_action :set_sitem, only: %i[ show edit update destroy ]

  # GET /sitems or /sitems.json
  def index
    @sitems = Sitem.all
  end

  # GET /sitems/1 or /sitems/1.json
  def show
  end

  # GET /sitems/new
  def new
    @sitem = Sitem.new
  end

  # GET /sitems/1/edit
  def edit
  end

  # POST /sitems or /sitems.json
  def create
    @starfold = current_starfold
    product = Product.find(params[:product_id])
    # @item = @cart.add_product(product.id)
    @sitem = @starfold.add_product(product.id)

    respond_to do |format|
      if @sitem.save
        format.html { redirect_to @sitem.starfold, notice: "Sitem was successfully created." }
        format.json { render :show, status: :created, location: @sitem }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sitems/1 or /sitems/1.json
  def update
    respond_to do |format|
      if @sitem.update(sitem_params)
        format.html { redirect_to sitem_url(@sitem), notice: "Sitem was successfully updated." }
        format.json { render :show, status: :ok, location: @sitem }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sitems/1 or /sitems/1.json
  def destroy
    @sitem.destroy

    respond_to do |format|
      format.html { redirect_to current_starfold, notice: "Sitem was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sitem
      @sitem = Sitem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sitem_params
      params.require(:sitem).permit(:product_id, :starfold_id)
    end
end
