module SpaceFlightApi 
    module Articles 
        class Fetch < ApplicationService 
            attr_reader :start

            def initialize(start)
                @start = start || 1
            end

            def call 
                endpoint = "articles"
                endpoint += "?_start=#{@start}"

                request = SpaceFlightApi::Base.build_request(endpoint, 'get')
                body = JSON.parse(request.read_body) rescue nil

                body
            end
        end
    end
end
