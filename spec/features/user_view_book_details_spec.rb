require 'rails_helper'

	feature "view book details", %q(
	As a user
	I want to view a book's details
	So that I can see a book's details

	Acceptance Criteria

	- I must be able to get to this page from the books index
	- I must see the book's title
	- I must see the book's description
	- I must see the book's URL
	) do

	scenario "user can view book details via link" do
		visit show_books_path
		click_on "Book Test"

		expect(page).to have_content(
			title: "Book Test",
			description: "You're going to be building a website like goodreads.com so astronauts can post books and review them.",
			url: "http://www.google.com"
			)
	end
end