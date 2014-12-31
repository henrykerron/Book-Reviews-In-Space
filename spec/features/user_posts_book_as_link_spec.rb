require 'rails_helper'

feature "post a new book", %q(

	As a user
	I want to post a new book
	So I can share what I'm reading with others

	Acceptance Criteria

	[x] I must provide a title that is at least 1 character long
	[x] I must provide a description that is at least 10 characters long
	[x] I must provide a valid URL to the book
	[x] I must be presented with errors if I fill out the form incorrectly
	[x]	I must be signed in to add a new book
	) do
	context "authenticated user" do
		before(:each) do
			user = User.create(
				email: "gp@gmail.com",
				password: "password"
				)

			visit new_user_session_path
			fill_in "Email", with: user.email
			fill_in "Password", with: user.password
			click_button "Log in"

			visit new_book_path
		end

		scenario 'user posts a book' do
			fill_in "Title", with: "Hunger Games"
			fill_in "Description", with: "1st Book in the Series"
			fill_in "Url", with: "https://www.goodreads.com/book/show/2767052-the-hunger-games?from_search=true"
			click_on "Add Book"

			expect(page).to have_content("New book submitted successfully!")
		end

		scenario 'user gets errors if form is filled out incorrectly' do
			visit new_book_path
			click_on "Add Book"

			expect(page).to have_content("Title is too short (minimum is 1 characters)")
			expect(page).to have_content("Description is too short (minimum is 10 characters)")
			expect(page).to have_content("Url can't be blank")
		end
	end

	context "unauthenticated user" do
		scenario	"cannot accesst add-new-book form" do
			visit new_book_path

			expect(page).to have_content "You need to sign in or sign up before continuing."
		end
	end
end