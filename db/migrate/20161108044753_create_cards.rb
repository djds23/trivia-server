class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.belongs_to :categories
      t.string :question
      t.string :answer
      t.datetime :deactivated_at

      t.timestamps
    end
  end
end
