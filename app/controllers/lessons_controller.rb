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
            # Check if the code was sent to hackerrank API
            if @result[:error] == nil 
                flash[:notice] = "Your code was submitted successfully!" 
            else 
                flash[:notice] = "Your code submitted successfully"
            end
        end
    end 
end
