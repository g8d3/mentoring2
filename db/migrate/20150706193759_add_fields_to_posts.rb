class AddFieldsToPosts < ActiveRecord::Migration
  def change
  	change_table :posts do |t|
  		["weekly_time", "time", "money", "how_learned", "built", "reason", "email"].each do |f|
  			t.string f
  		end
  	end
  end
end
