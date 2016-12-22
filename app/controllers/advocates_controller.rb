class AdvocatesController < ApplicationController
  before_action :set_advocate, only: [:show, :edit, :update, :destroy]

  # GET /advocates
  # GET /advocates.json
  def index
    @advocates = Advocate.all
  end

  # GET /advocates/1
  # GET /advocates/1.json
  def show
  end

  # GET /advocates/new
  def new
    @advocate = Advocate.new
  end

  # GET /advocates/1/edit
  def edit
  end

  # POST /advocates
  # POST /advocates.json
  def create
    @advocate = Advocate.new(advocate_params)

    respond_to do |format|
      if @advocate.save
        format.html { redirect_to @advocate, notice: 'Advocate was successfully created.' }
        format.json { render :show, status: :created, location: @advocate }
      else
        format.html { render :new }
        format.json { render json: @advocate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /advocates/1
  # PATCH/PUT /advocates/1.json
  def update
    respond_to do |format|
      if @advocate.update(advocate_params)
        format.html { redirect_to @advocate, notice: 'Advocate was successfully updated.' }
        format.json { render :show, status: :ok, location: @advocate }
      else
        format.html { render :edit }
        format.json { render json: @advocate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advocates/1
  # DELETE /advocates/1.json
  def destroy
    @advocate.destroy
    respond_to do |format|
      format.html { redirect_to advocates_url, notice: 'Advocate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advocate
      @advocate = Advocate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advocate_params
      params.require(:advocate).permit(:f_name, :l_name, :dob, :phone)
    end
end
