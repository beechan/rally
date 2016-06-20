class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :owner_id #イベント主催者ID
      t.string :event_name　#イベント名
      t.string :place #/*イベントの場所*/
      t.string :content #/*イベント内容*/
      t.datetime :event_starting_time #/*イベント開始時刻*/
      t.datetime :event_end_time #/*イベント終了時刻*/
      t.boolean :event_status #/*イベント確定通知..各ユーザのスケジュールへの書き込みフラグ*/

      t.timestamps null: false
    end
  end
end
