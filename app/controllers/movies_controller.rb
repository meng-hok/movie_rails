class MoviesController < ApplicationController
    include MoviesHelper
    include ApplicationHelper
    @origin_testing_var 
    
    
    def create
        @movie = Movie.new(movie_params) 
       
        if @movie.save
            redirect_to @movie  
        else
            render "new"
        end    

    end
    
    def new
        @movie = Movie.new

    end
    

    def update

        @movie = Movie.find( params[:id] )

        if @movie.update( movie_params )
            redirect_to  movie_path(params[:id])
        else
            render "new"
            # view("new")
        end

    end    

    def edit
        @movie = Movie.find(params[:id])
    end 

    def show
        @id = params[:id]
        @main = ""
       
        Movie.find(@id).attributes.values.map do |x|
                # puts x.methods
               @main +=  "<li>#{x}</li>"
        end
        
        @x =  Movie.find(@id)
        @sub = " <li>
                        #{ @x.id }
                </li>
                <li>      
                    #{ @x.title }
                </li>
                <li> 
                    (#{ @x.rating }) 
                </li>
                <li>   
                    #{ @x.total_gross }
                </li>
                <li>   
                    #{ @x.description}
                </li>
                <li>   
                    #{@x.released_on}
                </li>
                <li>   
                    #{@x.director}
                </li>
               "

        # @main = @main.html_safe
    end

    def index
        @arr_movie = ['Iron man','Super man','Spider man']
        
        @arr_title = Movie.all.map do |x|
                    x.title
        end

        @html_v = array_list_test(@arr_movie)    

        # from db
        arr_store =  Movie.orderby
        
        @arr2_movie = arr_store
          
         @testing_loop = ul_of_movie_info(@arr2_movie)
    end    

    def ul_of_movie_info(var)
        main = ""
        var.each do |x|
            sub = ""
             x.attributes.each do |y|
                sub += "<li>#{y}</li>" 
             end           
           main += "<ul>#{sub}</ul>" 

        end

        return main.html_safe
    end

    def array_list_test(var)
        data = '';
        var.each do |x|
           data += "<p>#{x}</p>"
        end
        return data.html_safe
        
    end
     
    def destroy
        @object = Movie.find(params[:id])
        @object.destroy
        redirect_to movies_path   
    end
    
    private
    def movie_params
        params
        .require(:movie)
        .permit(:title,:description,:rating,:released_on,:total_gross,:cast,:director,:duration,:image_file_name)
    end
  
    
end
