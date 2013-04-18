class AddBookIdToBook < ActiveRecord::Migration
  def change
    add_column :books, :b_id, :string
  end
end
