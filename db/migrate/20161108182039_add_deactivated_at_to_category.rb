class AddDeactivatedAtToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :deactivated_at, :datetime, null: true
  end
end
