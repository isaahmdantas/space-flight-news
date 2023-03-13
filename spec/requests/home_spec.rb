require 'swagger_helper'

RSpec.describe 'home', type: :request do

  path '/' do

    get('Rota Padrão') do
      response(200, 'Sucesso') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
