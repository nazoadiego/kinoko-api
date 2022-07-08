class CreateWorkSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :work_sessions do |t|
      t.integer :minutes
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
