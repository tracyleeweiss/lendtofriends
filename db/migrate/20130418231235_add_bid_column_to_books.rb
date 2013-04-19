class AddBidColumnToBooks < ActiveRecord::Migration
  def change
    add_column :books, :b_id, :string
    add_column :books, :image_url, :string
  end
end
