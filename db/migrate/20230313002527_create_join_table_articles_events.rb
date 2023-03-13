class CreateJoinTableArticlesEvents < ActiveRecord::Migration[7.0]
  def change
    create_join_table :articles, :events do |t|
      # t.index [:article_id, :event_id]
      # t.index [:event_id, :article_id]
    end
  end
end
