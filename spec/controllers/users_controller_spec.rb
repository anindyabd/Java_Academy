require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    
    describe "GET #show" do
        it "routes correctly" do
            user = double('user')
            allow_message_expectations_on_nil
            allow(request.env['warden']).to receive(:authenticate!) { user }
            allow(controller).to receive(:current_user) { user }
            
            expect(User).to receive(:find).with("1") { user } 
            get :show, id: 1 
            expect(response.status).to eq(200)
    
        end
    end
end
