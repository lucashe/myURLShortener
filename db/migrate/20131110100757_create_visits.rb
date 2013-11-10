class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :ip
      t.string :os

      t.timestamps
    end
  end
end
