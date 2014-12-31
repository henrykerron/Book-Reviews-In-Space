require 'rails_helper'

feature "user can view details of a book", %q(
	As a user
	I want to view a book's details
	So that I can see a book's details

	Acceptance Criteria

	[x] I must be able to get to this page from the books index
	[x] I must see the book's title
	[x] I must see the book's description
	[x] I must see the book's URL
	) do

	scenario "book link takes user to book details page" do
		# book = Book.create(
		# 	title: "Hunger Games 2",
		# 	description: "Lorem ipsum dolor sit amet porttitor odio accumsan enim. Elit sed metus vel aliquam habitant eget lorem wisi. Interdum a fusce. At urna est vel lorem ipsum. Orci vel at. Nunc ac justo. Proin nec lacus sit at erat mauris erat mi. Ac sed aliquam. Suspendisse nonummy convallis morbi tincidunt.",
		# 	url: "http://www.google.com"
		# 	)

		user = User.create(
			email: "gp@gmail.com",
			password: "1natalias",
			password_confirmation: "1natalias"
			)

		visit books_path
		click_on "Sign In"

		fill_in "Email", with: user.email
		fill_in "Password", with: user.password
		click_button "Log in"

		click_on "Post a book!"

		fill_in "Title", with: "Hunger Games 2"
		fill_in "Description", with: "Lorem ipsum dolor sit amet porttitor odio accumsan enim. Elit sed metus vel aliquam habitant eget lorem wisi. Interdum a fusce. At urna est vel lorem ipsum. Orci vel at. Nunc ac justo. Proin nec lacus sit at erat mauris erat mi. Ac sed aliquam. Suspendisse nonummy convallis morbi tincidunt."
		fill_in "Url", with: "http://www.google.com"
		click_button "Add Book"

		click_on "Hunger Games 2"

		expect(page).to have_content("Hunger Games 2")
		# expect(page).to have_content book.description
		# expect(page).to have_content book.url
	end
end