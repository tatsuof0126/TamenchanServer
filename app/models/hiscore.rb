class Hiscore < ActiveRecord::Base
  attr_accessible :achieved_date, :devid, :name, :rank, :score, :gamelevel
end
