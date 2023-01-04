class StarfoldsController < ApplicationController
  before_action :set_starfold, only: %i[ show edit update destroy ]
  before_action :authenticate_admin, only: %i[ index ]

  # GET /starfolds or /starfolds.json
  def index
    @starfolds = Starfold.all
  end

  # GET /starfolds/1 or /starfolds/1.json
  def show
  end

  # GET /starfolds/new
  def new
    @starfold = Starfold.new
  end

  # GET /starfolds/1/edit
  def edit
  end

  # POST /starfolds or /starfolds.json
  def create
    @starfold = Starfold.new(starfold_params)

    respond_to do |format|
      if @starfold.save
        format.html { redirect_to starfold_url(@starfold), notice: "Starfold was successfully created." }
        format.json { render :show, status: :created, location: @starfold }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @starfold.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /starfolds/1 or /starfolds/1.json
  def update
    respond_to do |format|
      if @starfold.update(starfold_params)
        format.html { redirect_to starfold_url(@starfold), notice: "Starfold was successfully updated." }
        format.json { render :show, status: :ok, location: @starfold }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @starfold.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /starfolds/1 or /starfolds/1.json
  def destroy
    @starfold.destroy

    respond_to do |format|
      format.html { redirect_to starfolds_url, notice: "Starfold was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_starfold
      @starfold = Starfold.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def starfold_params
      params.fetch(:starfold, {})
    end
end
