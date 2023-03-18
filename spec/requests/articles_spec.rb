require 'swagger_helper'

describe 'Articles' do

  path '/articles' do
    get 'list articles' do
      tags 'Article'
      parameter name: 'page', :in => :query, :type => :integer, required: true, description: 'Number of page', :example => 1
      parameter name: 'per_page', :in => :query, :type => :integer, required: true, description: 'Number Limit of page', :example => 10

      response(200, 'successfully') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response, symbolize_names: true)
            }
          }
        end
        run_test!
      end

    
    end
  end 
end
