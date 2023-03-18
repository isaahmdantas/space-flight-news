namespace :articles do

    desc "Script para salvar os articles da API Space Flight"
  
    task write_database: :environment do
        total_pages = SpaceFlightApi::Articles::Count.new().call
        
        ar_internal_metadata = ArInternalMetadata.first
        first_page = ar_internal_metadata.total_articles == 0 ? 1 : ar_internal_metadata.current_article

        ar_internal_metadata.update(total_articles: total_pages)
        
        (first_page..total_pages).each do |page|
            ArticleWriteDatabaseJob.perform_now(page)
        end   
    end
end