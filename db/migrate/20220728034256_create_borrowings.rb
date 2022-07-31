class CreateBorrowings < ActiveRecord::Migration[7.0]
  def change
    create_table :borrowings do |t|
      t.bigint :book_id
      t.bigint :user_id
      t.timestamp :release_date
      t.timestamp :due_date

      t.timestamps
    end
  end
end
