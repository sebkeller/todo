class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title, limit: 200
      t.string :description, limit: 1000
      t.boolean :completed, default: false
      t.date :due_date

      t.timestamps
    end
  end
end
