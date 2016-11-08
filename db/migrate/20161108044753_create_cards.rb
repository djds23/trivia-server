class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.belongs_to :category, null: false
      t.string :question, null: false
      t.string :answer, null: false
      t.datetime :deactivated_at

      t.timestamps
    end
  end
end
