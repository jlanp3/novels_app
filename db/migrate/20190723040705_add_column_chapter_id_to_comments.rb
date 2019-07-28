class AddColumnChapterIdToComments < ActiveRecord::Migration[5.1]
  def change
  	add_column :comments, :chapter_id, :integer
  end
end
