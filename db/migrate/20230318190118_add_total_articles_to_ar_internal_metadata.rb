class AddTotalArticlesToArInternalMetadata < ActiveRecord::Migration[7.0]
  def change
    add_column :ar_internal_metadata, :total_articles, :integer, default: 0
    add_column :ar_internal_metadata, :current_article, :integer, default: 0
  end
end
