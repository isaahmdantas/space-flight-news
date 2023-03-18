module SpaceFlightApi 
    module Articles 
        class Count < ApplicationService 
            
            def call 
                request = SpaceFlightApi::Base.build_request('articles/count', 'get')
                body = JSON.parse(request.read_body) rescue nil

                body
            end
        end
    end
end
