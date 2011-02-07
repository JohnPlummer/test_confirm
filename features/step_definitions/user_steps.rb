Given /^I am not signed in$/ do
	visit('/users/sign_out')
end

Then /^a new user should get created with the following details:$/ do |table|
	expected = User.new table.hashes.first
	@user    = User.find_by_email(expected.email)
	@user.should_not be_nil
end