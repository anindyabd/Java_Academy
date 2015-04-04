require 'rails_helper'

RSpec.describe LessonsController, type: :controller do

  describe "GET #index" do
    it "routes correctly" do
      get :index
      expect(response.status).to eq(200)
    end

  end

  describe "GET #show" do
    it "routes correctly" do
      l = Lesson.new
      expect(Lesson).to receive(:find).with("1") { l }
      get :show, id: 1
      expect(response.status).to eq(200)
    end

    it "renders the show template" do
      l = Lesson.new
      expect(Lesson).to receive(:find).with("1") { l }
      get :show, id: 1
      expect(response).to render_template(:show)
    end
  end

  describe "POST #submit" do
  	context "given valid submit" do
      
  	  
      it "should show success flash message and " do
        lesson1 = Lesson.new(number: 1, name: "Hello World!", 
            description: "Printing strings in Java", 
            instruction: "In Java, you can print to console by using the 
                        System.out.println call. Try printing the string
                        \"Hello World!\" to the screen by putting the right
                        parameter in the coding window.",
            skeleton_code: "public class HelloWorld {

    public static void main(String[] args) {
        System.out.println(\"Hello World\");
    }

}",
            testcases: ["1","2","aa"],
            expectedresults: ["Hello World\n","Hello World\n","Hello World\n"]
             )
        code = nil 
        post :submit, {:lessonid => lesson1.id, :realacesubmit => code}
 	      #params[:realacesubmit].should != "" and params[:realacesubmit].should != nil
        expect(response.status).to eq(200)
 	    end

   	  
    end
  end

end
