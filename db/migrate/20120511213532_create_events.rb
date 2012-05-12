class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :startdate
      t.string :starttime
      t.string :enddate
      t.string :endtime

      t.timestamps
    end
  end
end
