class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :published_year
      t.integer :copies
      t.bigint :genre_id

      t.timestamps
    end
  end
end
