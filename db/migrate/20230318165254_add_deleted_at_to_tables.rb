class AddDeletedAtToTables < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :deleted_at, :datetime
    add_index :articles, :deleted_at

    add_column :events, :deleted_at, :datetime
    add_index :events, :deleted_at

    add_column :launches, :deleted_at, :datetime
    add_index :launches, :deleted_at

    add_column :articles_launches, :deleted_at, :datetime
    add_index :articles_launches, :deleted_at

    add_column :articles_events, :deleted_at, :datetime
    add_index :articles_events, :deleted_at
  end
end
