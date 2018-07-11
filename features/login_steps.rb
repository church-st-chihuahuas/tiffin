When(/^A user goes to the signin page$/) do
  visit login_url
end

Then(/^They should see the login form$/) do
  expect(page).to have_content("Sign in")
end