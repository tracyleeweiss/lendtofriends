class ChangeBorrowerIdToBorrowerName < ActiveRecord::Migration
  def change
  	remove_column :books, :borrower_id
  	add_column :books, :borrower_name, :string
  end
end
