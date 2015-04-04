require 'rails_helper'

RSpec.describe LessonsController, type: :controller do

  describe "GET #index" do
    it "routes correctly" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders the index template and sorts by name by default" do
      x, y = Lesson.create!, Lesson.create!
      expect(Lesson).to receive(:sorted_by).with("name") { [x,y] }
      get :index
      expect(response).to render_template(:index)
      expect(assigns(:lessons)).to match_array([x,y])
    end
  end

  describe "GET #show" do
    it "routes correctly" do
      expect(Lesson).to receive(:find).with("1") { l }
      get :show, id: 1
      l = Lesson.new
      expect(response.status).to eq(200)
    end

    it "renders the show template" do
      expect(Lesson).to receive(:find).with("1") { l }
      get :show, id: 1
      expect(response).to render_template(:show)
    end
  end

  describe "POST #submit" do
  	context "given valid submit" do
  	  it "should show success flash message and " do
 	    l = Lesson.find params[:lessonid]
 	    Lesson.should_receive(:find).and_return(l)
 	    params[:realacesubmit].should != "" and params[:realacesubmit].should != nil
 	    result = l.check_submission(params[:realacesubmit])
 	    result[:stdout].should != nil
 	    post :submit, :lessonid => params[:lessonid]
 	  end

 	  it "should show failure flash message" do 
 	    l = Lesson.find params[:lessonid]
 	    Lesson.should_receive(:find).and_return(l)
 	    params[:realacesubmit].should != "" and params[:realacesubmit].should != nil
 	    result = l.check_submission(params[:realacesubmit])
 	    result[:stdout].should != nil
 	    #post :submit, :lessonid => params[:lessonid]
 	  end
    end
   end

end
