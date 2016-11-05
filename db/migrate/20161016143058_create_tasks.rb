class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.date :goal_date
      t.belongs_to :course, index: true
      t.timestamps
    end
  end
end
