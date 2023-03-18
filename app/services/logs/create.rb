module Logs 
    class Create < ApplicationService 
        attr_reader :file, :type, :message 

        def initialize(file, type, message)
            @file = file 
            @type = type 
            @message = message 
        end

        def call 
            logger = ::Logger.new("log/#{@file}.log", 'monthly')
            case @type 
                when "info"
                    logger.info(@message)
                when "debug"
                    logger.debug(@message)
                when "error"
                    logger.error(@message)
                when "warn"
                    logger.warn(@message)
                when "fatal"
                    logger.fatal(@message)
                else
                    logger.unknown(@message)
                end
        end
    end

end
