class HiscoreTransController < ApplicationController

  def index
    render json: gethiscorelist
  end

  def create
    gamelevel = params[:gamelevel]
    if gamelevel == nil
      gamelevel = 1
    end
    
    id = []
    devid = []
    name = []
    score = []
    date = []
    
    id[0] = params[:id0]
    devid[0] = params[:devid0]
    name[0] = params[:name0]
    score[0] = params[:score0]
    date[0] = params[:date0]
    
    id[1] = params[:id1]
    devid[1] = params[:devid1]
    name[1] = params[:name1]
    score[1] = params[:score1]
    date[1] = params[:date1]

    id[2] = params[:id2]
    devid[2] = params[:devid2]
    name[2] = params[:name2]
    score[2] = params[:score2]
    date[2] = params[:date2]

    id[3] = params[:id3]    
    devid[3] = params[:devid3]
    name[3] = params[:name3]
    score[3] = params[:score3]
    date[3] = params[:date3]

    id[4] = params[:id4]
    devid[4] = params[:devid4]
    name[4] = params[:name4]
    score[4] = params[:score4]
    date[4] = params[:date4]

    hiscore = []
    for i in 0..4
      hiscore[i] = Hiscore.new
      
      if id[i] != nil
        hiscore[i].id = id[i]
      elsif
        id[i] = 0; #ダミーID
      end
      
      hiscore[i].devid = devid[i]
      hiscore[i].name = name[i]
      hiscore[i].score = score[i]
      hiscore[i].achieved_date = date[i]
      hiscore[i].gamelevel = gamelevel
      
      hiscorelist = Hiscore.find(:all, 
        :conditions => ["gamelevel = ? and score >= ? and id <> ?", gamelevel, score[i], id[i]])
      hiscore[i].rank = hiscorelist.length+1
        
      if hiscore[i].id == nil
        hiscore[i].save
      end
    end

    render json: hiscore
  end

  def gethiscorelist
    gamelevel = params[:gamelevel]
    if gamelevel == nil
      gamelevel = 1
    end
    
    hiscorelist = Hiscore.find(:all,
      :conditions => { :gamelevel => gamelevel }, :order => 'score desc, id', :limit => '20' )
    
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

end
