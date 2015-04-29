class LessonsController < ApplicationController
  # Authenticate before starting lesson. Break some tests. 
  # before_action :authenticate_user!, only: [:show, :submim]
  def index
    @lessons = Lesson.all  
  end 

  def show
    @lesson = Lesson.find(params[:id])
  end 

  def submit
  
    # Submit only if the text edditor is not blank
    if params[:realacesubmit] != nil and params[:realacesubmit] != ""
      @lesson = Lesson.find(params[:lessonid]) 
      @result = @lesson.check_submission(params[:realacesubmit]) 
      # Check if the code was sent to hackerrank API
      if @result[:error].nil?
        flash[:note] = "Your code was submitted successfully!" 
        # Add this to user records
        if user_signed_in? and current_user.id != nil
          if @result[:testspassed].all? 
            @user = User.find(current_user.id) 
            @user.add_lesson(params[:lessonid])
          end
        end
    end 


      else 
        flash[:warning] = "There was a problem submitting your code." 
      end
    end
    

  
end
