module SpaceFlightApi 
    class Base < ApplicationService
        BASE_URL = "https://api.spaceflightnewsapi.net/v3"


        def self.build_request(endpoint, metodo, body=nil)
            url = URI("#{SpaceFlightApi::Base::BASE_URL}/#{endpoint}")
            
            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true

            case metodo
                when "delete"
                    request = Net::HTTP::Delete.new(url)
                when "get"
                    request = Net::HTTP::Get.new(url)
                when "put"
                    request = Net::HTTP::Put.new(url)
                when "patch"
                    request = Net::HTTP::Patch.new(url)
                when "post"
                    request = Net::HTTP::Post.new(url)
            end
    
            request = SpaceFlightApi::Base.default_headers(request)
        
            request.body = body.to_json unless body.nil?
            begin
                response = http.request(request)
         
                response
            rescue NetHttpTimeoutErrors::ALL_NET_HTTP_ERRORS => e 
                ExceptionNotifier.notify_exception(e)
                Logs::Create.call("spaceflightnewsapi", "error", e)

                nil 
            end
        end 

        def self.default_headers(request)
            request["Content-Type"] = "application/json"
            request["Accept"] = "application/json"


            request 
        end

    end
end