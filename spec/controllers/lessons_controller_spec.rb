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
      l = double('lesson')
      expect(Lesson).to receive(:find).with("1") { l }
      get :show, id: 1
      expect(response.status).to eq(200)
    end

    it "renders the show template" do
      l = double('lesson')
      expect(Lesson).to receive(:find).with("1") { l }
      get :show, id: 1
      expect(response).to render_template(:show)
    end
  end

  describe "POST #submit" do
  	context "given valid submit" do
      it "should show success flash message" do
        fakeresults = double('lesson1') 
        expect(Lesson).to receive_message_chain(:find, :check_submission).and_return(fakeresults) 
        allow(fakeresults).to receive(:[]).with(:stdout).and_return("not nil")
        code = "Hello World" 
        post :submit, {:lessonid => 1, :realacesubmit => code}
        expect(response.status).to eq(200)
 	    end
    end
    context "given invalid submit" do 
      it "should show failed flash message" do 
        fakeresults = double('lesson1')
        expect(Lesson).to receive_message_chain(:find, :check_submission).and_return(fakeresults) 
        allow(fakeresults).to receive(:[]).with(:stdout).and_return(nil)
        code = "Hello World" 
        post :submit, {:lessonid => 1, :realacesubmit => code}
        expect(response.status).to eq(200)
      end
    end
  end

end
