require_relative '../spec_helper'

describe "Create Category" do

  it "logged in user can create category" do
    user = User.create!(
      full_name: 'ram sht',
      email: 'ram2000@yahoo.com',
      password: 'sanil_123',
      group_id: '1'
    )
    user2 = User.create!(
      full_name: 'shyam sht',
      email: 'hello@example.com',
      password: 'sanil_123',
      group_id: '2'
    )


    visit '/users/sign_in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'


    visit '/categories/new'

    fill_in 'Name', with: 'test category'
    fill_in 'Description', with: 'test category Description'
    click_button 'Create Category'

    expect(Category.last.name).to eq('test category')
    #expect(Album.last.user).to eq(user)
    #expect(Album.last.user).not_to eq(user2)

  end

  it "title cannot be blank" do

    user = User.create!(
      full_name: 'ram sht',
      email: 'ram2000@yahoo.com',
      password: 'sanil_123',
      group_id: '1'
    )

    visit '/users/sign_in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'


    visit '/categories/new'

    fill_in 'Name', with: 'test'
    fill_in 'Description', with: 'test category Description'
    click_button 'Create Category'


   expect(page).to have_content 'successfully'
  end
end