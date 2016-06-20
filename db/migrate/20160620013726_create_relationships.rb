class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :event_id, index: true, foreign_key: true #イベントID
      t.integer :visitor_id, index: true, foreign_key: true#来訪者ID
      t.boolean :event_flag #行きたいかどうかのステータス
      t.boolean :attendance_status #参加意思決定

      t.timestamps null: false
    end
  end
end
