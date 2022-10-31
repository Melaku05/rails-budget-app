require 'rails_helper'

RSpec.describe 'CategoriesIndexPage', type: :feature do
  before(:each) do
    @user = User.create!(name: 'Testing', email: 'user12@example.com', password: 'password')
    @user.save
    visit user_session_path
    fill_in 'user[email]', with: 'user12@example.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Log in'
    @category = Group.create!(name: 'Food', user_id: @user.id)
    @category.save
    visit groups_path
  end
end
