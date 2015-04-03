class LessonsController < ApplicationController

    def index
       @lessons = Lesson.all  
    end 

    def show
        @lesson = Lesson.find(params[:id])
    end 

    def submit
        @lesson = Lesson.find(params[:lessonid])       
        if params[:realacesubmit] != nil and params[:realacesubmit] != ""
            @result = @lesson.check_submission(params[:realacesubmit]) 
            if @result[:stdout] != nil
                flash[:notice] = "Your code executed successfully!"
            else
                flash[:notice] = "Your code did not compile successfully. There must be a syntax error somewhere..."
            end

        end

    end 
end
