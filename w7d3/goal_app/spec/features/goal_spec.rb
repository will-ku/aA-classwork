require 'spec_helper'
require 'rails_helper'

feature 'the goal creation process' do
    scenario 'has a new goal page' do
        visit new_goal_url
        expect(page).to have_content 'Goal'
    end

    feature 'creating a goal' do
        before(:each) do
            visit new_goal_url
            fill_in 'title', with 'graduation'
        end
    end


end