require 'rails_helper'

feature "user signs up", %q(

	As a prospective user
	I want to create an account
	So that I can post books and review them	

	[x] There is a link to 'Sign Up' on the homepage.
	[x] If I fill in my email, password, and password confirmation correctly, I am greeted with a confirmation message that my account has been created.
	[x] If the password and password confirmation fields do not match, I am given an error message.
	[x] If my email already exists in the database, I am given a message that tells me I have already registered.
	[x] If my email is not formatted correctly, I am given an error message.
	) do 


	scenario "user fills in valid information in sign up form" do
		visit books_path
		click_on "Sign Up"
		
		select "astronaut", from: "Role"
		fill_in "Email", with: "gp@gmail.com"
		fill_in "Password", with: "password"
		fill_in "Password confirmation", with: "password"
		click_button "Sign up"

		expect(page).to have_content "Welcome! You have signed up successfully."
	end
end