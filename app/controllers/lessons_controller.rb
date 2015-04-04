class LessonsController < ApplicationController

    def index
       @lessons = Lesson.all  
    end 

    def show
        @lesson = Lesson.find(params[:id])
    end 

    def submit
        if params[:realacesubmit] != nil and params[:realacesubmit] != ""
            @result = Lesson.find(params[:lessonid]).check_submission(params[:realacesubmit]) 
            @result[:stdout] != nil ? flash[:notice] = "Your code executed successfully!" : flash[:notice] = "Your code did not compile successfully. There must be a syntax error somewhere..."
        end
    end 
end
