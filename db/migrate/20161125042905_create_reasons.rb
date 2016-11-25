class CreateReasons < ActiveRecord::Migration[5.0]
  def change
    create_table :reasons do |t|
      t.string :display_name
      t.datetime :deactivated_at
      t.string :machine_name

      t.timestamps
    end
  end
end
