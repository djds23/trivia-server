class CreateCardsReasonsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :cards_reasons_tables do |t|
      t.integer :card_id, null: false
      t.integer :reason_id, null: false
    end
  end
end
