require 'rails_helper'

RSpec.describe User, type: :model do
  
  context "the add_lessons method should work" do   
  
    it "should add a new lesson" do 
      user = User.new
      lesson = Lesson.new
      lessons = user.add_lesson(1) 
      expect(lessons).to eq(user.lessons)
    end
  end 
end
