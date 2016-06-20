class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :user_id #/*誰のスケジュールか*/
      t.datetime :starting_time #/*ひま時間かいし*/
      t.datetime :end_time #/*ひま時間おわり*/

      t.timestamps null: false
    end
  end
end
