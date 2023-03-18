class ArticleWriteDatabaseJob < ApplicationJob
    queue_as :default

    def perform(page)
        ArInternalMetadata.first.update(current_article: page)
        
        articles = SpaceFlightApi::Articles::Fetch.new(page).call
        articles.map do |article|
            new_article = Article.find_or_create_by(
                id: article.try(:[], 'id'),
                featured: article.try(:[], 'featured'),
                title: article.try(:[], 'title'),
                url: article.try(:[], 'url'),
                imageUrl: article.try(:[], 'imageUrl'),
                newsSite: article.try(:[], 'newsSite'),
                summary: article.try(:[], 'summary'),
                publishedAt: article.try(:[], 'publishedAt')
            )
            article.try(:[], 'launches').map do |launch|
                l = Launch.find_or_create_by(_id: launch.try(:[], 'id'))
                l.provider = launch.try(:[], 'provider')
                new_article.launches << l 
            end
            article.try(:[], 'events').map do |event|
                ev = Event.find_or_create_by(_id: event.try(:[], 'id'))
                ev.provider = event.try(:[], 'provider')
                new_article.events << ev
            end
            unless new_article.save! 
                Logs::Create.call("article_write_database_job", "error", e)
            else
                Logs::Create.call("article_write_database_job", "info", "Article created successfully! (#{new_article.try(:id)}-#{new_article.try(:title)})")
            end
        end
    end
end