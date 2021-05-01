require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
    subject(:user) { User.create!(username: 'willku', password: 'password') }

    describe 'GET #new' do 
        it 'renders the new goal page' do
            get :new
            expect(response).to render_template(:new)
            expect(response).to have_http_status(200)
        end
    end

    describe 'POST #create' do
        context 'with valid params' do
            it 'creates the goal and redirects to user show page' do
                user = User.find_by(username: "willku")
                post :create, params: {goal: {title:'Graduate', user_id: user.id, private:true}}   
                expect(response).to redirect_to(user_url(user))
            end
        end

        context 'with invalid params' do
            it 'redirects to new goal page' do
                post :create, params: {goal: {title:'', user_id: user.id, private:true}}   
                expect(response).to redirect_to(new_goal_url)
                expect(flash[:errors]).to be_present
            end
        end
    end

    describe 'GET #show' do
        context 'with valid goal' do
            it 'renders show page for goal' do
                goal = Goal.create!(title:'Graduate', user_id: user.id, private:true)
                get :show, params: {id: goal.id}
                expect(response).to render_template(:show)
            end
        end
    end
end
