class CreateCardsReasonsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :card_flags do |t|
      t.integer :card_id, null: false
      t.integer :reason_id, null: false
      t.datetime :activated_at
    end
  end
end
