class LessonsController < ApplicationController

    def index
        # This is mostly for testing if this idea works. It is hard coded
        if params[:realacesubmit] != nil and params[:realacesubmit] != ""
            resulting_code = Lesson.find(2).check_submission(params[:realacesubmit]) 
            @result = resulting_code
        end
    end 

    def show
        @lesson = Lesson.find(params[:id])
    end 

end
