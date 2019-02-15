module MoviesHelper
    
    def image_for(image)
        # image path
        image.blank? ? image_tag("download.jpeg")  : ""
    end
    def format_total_gross(amount)
        
        if amount > 5000000
           " <b>Flop</b>".html_safe
        else
            number_to_currency(amount)
        end    
    end
    
end
