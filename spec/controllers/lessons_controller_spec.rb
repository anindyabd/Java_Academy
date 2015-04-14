require 'rails_helper'

RSpec.describe LessonsController, type: :controller do

  describe "GET #index" do
    it "routes correctly" do
      user = double('user')
      allow_message_expectations_on_nil
      allow(request.env['warden']).to receive(:authenticate!) { user }
      allow(controller).to receive(:current_user) { user }
      get :index
      expect(response.status).to eq(200)
    end

  end

  describe "GET #show" do
    
    before(:each) do   
      user = double('user')
      allow_message_expectations_on_nil
      allow(request.env['warden']).to receive(:authenticate!) { user }
      allow(controller).to receive(:current_user) { user }
    end 

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

    before(:each) do 
      @fakeresults = double('lesson1') 
      @code = "Hello World"
      expect(Lesson).to receive_message_chain(:find, :check_submission).and_return(@fakeresults) 
    end

  	context "if could not submit code" do
      it "should show failure flash message" do
        allow(@fakeresults).to receive(:[]).with(:error).and_return("not nil")
        post :submit, {:lessonid => 1, :realacesubmit => @code}
        expect(response.status).to eq(200)
 	    end
    end
    context "if code was submitted successfully" do 
      it "should show success flash message" do 
        allow(@fakeresults).to receive(:[]).with(:error).and_return(nil)
        post :submit, {:lessonid => 1, :realacesubmit => @code}
        expect(response.status).to eq(200)
      end
    end
  end

end
