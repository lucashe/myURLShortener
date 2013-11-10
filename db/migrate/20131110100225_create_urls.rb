class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :longURL
      t.string :shortURL

      t.timestamps
    end
  end
end
