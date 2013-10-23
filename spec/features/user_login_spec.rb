require_relative '../spec_helper'

describe "the signin process", :type => :features do

  #create a user
  before :each do
    User.create(:full_name=> 'Sanil Shrestha',:email => 'santonil2004@yahoo.com', :password => 'sanil_123',:group_id => '1')
  end

  #sigin in using created user
  it "signs me in" do
    visit '/users/sign_in'
   
    fill_in 'Email', :with => 'santonil2004@yahoo.com'
    fill_in 'Password', :with => 'sanil_123'
 
    click_button 'Sign in'
    expect(page).to have_content 'successfully'
  end

  #try to login without some other credentials
   it "signs me in" do
    visit '/users/sign_in'
   
    fill_in 'Email', :with => 'santonil2004@yahoo.com'
    fill_in 'Password', :with => 'sanil_12345'
 
    click_button 'Sign in'
    expect(page).to have_content 'successfully'
  end
end