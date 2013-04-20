class ChangeBIdToId < ActiveRecord::Migration
 def change
 	rename_column :books, :b_id, :id

 end
end
