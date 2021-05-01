require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    # current_user, require_login, login(user), logged_in?, logout, optional: require_logout
    subject(:user) { User.create!(username: 'willku', password: 'password') }

    describe 'GET #new' do
        it 'renders the new users page' do 
            get :new
            expect(response).to render_template(:new)
            expect(response).to have_http_status(200)
        end
    end

    describe 'POST #create' do
        context 'with valid params' do
            it 'creates the user and redirects to user show page' do
                post :create, params: {user: {username: "willku", password: "password"}}   
                user = User.find_by(username: "willku")
                expect(response).to redirect_to(user_url(user))
            end
        end

        context 'with invalid params' do
            it 'redirects to new user page' do
                post :create, params: {user: {username: "willku", password: ""}}
                expect(response).to redirect_to(new_user_url)
                expect(flash[:errors]).to be_present
            end
        end
    end

    describe 'GET #show' do
        context 'with valid user' do
            it 'renders show page for user' do
                get :show, params: { id: user.id }
                expect(response).to render_template(:show)
            end
        end
    end
end
