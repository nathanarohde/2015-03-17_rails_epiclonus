class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.column :title, :string

      t.timestamps
    end
  end
end
