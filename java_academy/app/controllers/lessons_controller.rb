class LessonsController < ApplicationController

    def index
       @lessons = Lesson.all  
    end 

    def show
        @lesson = Lesson.find(params[:id])
    end 

    def submit 
        if params[:realacesubmit] != nil and params[:realacesubmit] != ""
            resulting_code = Lesson.find(params[:lessonid]).check_submission(params[:realacesubmit]) 
            @result = resulting_code
        end
    end 
end
