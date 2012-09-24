class HiscoresController < ApplicationController
  # GET /hiscores
  # GET /hiscores.json
  def index
#    @hiscores = Hiscore.all
    @hiscores = Hiscore.find(:all, :order => 'score desc, id')
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hiscores }
    end
  end

  # GET /hiscores/1
  # GET /hiscores/1.json
  def show
    @hiscore = Hiscore.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hiscore }
    end
  end

  # GET /hiscores/new
  # GET /hiscores/new.json
  def new
    @hiscore = Hiscore.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hiscore }
    end
  end

  # GET /hiscores/1/edit
  def edit
    @hiscore = Hiscore.find(params[:id])
  end

  # POST /hiscores
  # POST /hiscores.json
  def create
    @hiscore = Hiscore.new(params[:hiscore])

    respond_to do |format|
      if @hiscore.save
        format.html { redirect_to @hiscore, notice: 'Hiscore was successfully created.' }
        format.json { render json: @hiscore, status: :created, location: @hiscore }
      else
        format.html { render action: "new" }
        format.json { render json: @hiscore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hiscores/1
  # PUT /hiscores/1.json
  def update
    @hiscore = Hiscore.find(params[:id])

    respond_to do |format|
      if @hiscore.update_attributes(params[:hiscore])
        format.html { redirect_to @hiscore, notice: 'Hiscore was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hiscore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hiscores/1
  # DELETE /hiscores/1.json
  def destroy
    @hiscore = Hiscore.find(params[:id])
    @hiscore.destroy

    respond_to do |format|
      format.html { redirect_to hiscores_url }
      format.json { head :no_content }
    end
  end
end
