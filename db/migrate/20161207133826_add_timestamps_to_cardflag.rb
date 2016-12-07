class AddTimestampsToCardflag < ActiveRecord::Migration[5.0]
  def change
    add_column(:card_flags, :created_at, :datetime)
    add_column(:card_flags, :updated_at, :datetime)
  end
end
