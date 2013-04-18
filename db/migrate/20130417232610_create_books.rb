class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :id
      t.integer :owner_id
      t.integer :borrower_id

      t.timestamps
    end
  end
end
