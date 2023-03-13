class CreateJoinTableArticlesLaunches < ActiveRecord::Migration[7.0]
  def change
    create_join_table :articles, :launches do |t|
      # t.index [:article_id, :launch_id]
      # t.index [:launch_id, :article_id]
    end
  end
end
