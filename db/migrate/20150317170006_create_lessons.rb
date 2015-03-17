class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.column :title, :string
      t.column :content, :text
      t.column :section_id, :integer

      t.timestamps
    end
  end
end
