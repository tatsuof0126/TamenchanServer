class HiscoresController < ApplicationController

  def publicindex
    @hiscores_easy = Hiscore.find(:all,
      :conditions => { :gamelevel => 0 }, :order => 'score desc, id', :limit => '50' )
    
    @hiscores_normal = Hiscore.find(:all,
      :conditions => { :gamelevel => 1 }, :order => 'score desc, id', :limit => '50' )
    
    @hiscores_hard = Hiscore.find(:all,
      :conditions => { :gamelevel => 2 }, :order => 'score desc, id', :limit => '50' )
    
    calcrank(@hiscores_easy)
    calcrank(@hiscores_normal)
    calcrank(@hiscores_hard)
  end
  
  def calcrank(hiscorelist)
    num = 1
    rank = 1
    score = 0
    
    for hiscore in hiscorelist do
      if hiscore.score == score 
        hiscore.rank = rank
      else 
        hiscore.rank = num
        rank = num
        score = hiscore.score
      end
      num += 1
    end
    
    return hiscorelist
  end



  # GET /hiscores
  # GET /hiscores.json
  def index
#    @hiscores = Hiscore.all
    sort = params[:sort]
    if sort == "created"
      @hiscores = Hiscore.find(:all, :order => 'created_at desc')
    elsif 
      @hiscores = Hiscore.find(:all, :order => 'gamelevel, score desc, id')
    end
    
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
