class CreateChapters < ActiveRecord::Migration[5.1]
  def change
    create_table :chapters do |t|
      t.integer :chap
      t.string :name
      t.text :content
      t.integer :user_id
      t.integer :novel_id

      t.timestamps
    end
  end
end
