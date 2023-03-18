class Article < ApplicationRecord
    acts_as_paranoid
    
    has_and_belongs_to_many :launches, join_table: "articles_launches", dependent: :destroy 
    has_and_belongs_to_many :events, join_table: "articles_events", dependent: :destroy 

    validates :title, :url, :imageUrl, :newsSite, :publishedAt, presence: true 

    def as_json(options = {})
        super({
            except: [:created_at, :updated_at, :deleted_at]
        }.merge(options))
        .merge({
          launches: launches.map(&:as_json),
          events: events.map(&:as_json)
        })
    end
end