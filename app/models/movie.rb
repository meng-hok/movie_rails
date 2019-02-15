class Movie < ApplicationRecord
    RATINGS = %w(G PG PG-13 R NC-17)
    validates :title , :released_on, :duration, presence: true
    validates :description , length: { minimum:25 } 
    validates :total_gross , numericality: {
  
        greater_than_or_equal_to: 0
    }
    validates :image_file_name, allow_blank: true, format: {
             with:    /\w+\.(gif|jpg|png)\z/i,
            message: "must reference a GIF, JPG, or PNG image"
    } #blank is allowed but if with char require "extension" 

    validates :rating , inclusion: { in: RATINGS }

    def self.orderby
        order('released_on ASC ')
        
    end
    def self.whereId(var)
        where.not("id ==  ?", var)
    end
    def self.released
        order('released_on Desc')
    end
    #       only_integer: true    
    
end
