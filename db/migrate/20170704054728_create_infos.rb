class CreateInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :infos do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
    add_index :infos, :created_at
  end
end
