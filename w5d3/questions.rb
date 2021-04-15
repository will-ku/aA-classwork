require_relative "aaquestions.rb"

class Questions
    def initialize(options)
        @id, @title, @body, @author_id = options.values_at('id','title','body','author_id')      
    end
 
end