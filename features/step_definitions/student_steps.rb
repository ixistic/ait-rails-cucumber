Given(/^I am a teacher$/) do
  @user = FactoryGirl.create :teacher
end

Given(/^there is a project$/) do
  @project = FactoryGirl.create :project
end

Given(/^I want to add a student to the project$/) do
  @student = FactoryGirl.build :student
end

Given(/^I am signed in$/) do
  visit '/users/sign_in'
  fill_in 'user_email', with: @user.email
  fill_in 'user_password', with: @user.password
  click_button 'Log in'
end

When(/^I visit the projects page$/) do
  visit '/projects'
end

Then(/^I should see a link for the project$/) do
  expect(page).to have_link('Show', href: project_path(@project))
end

When(/^I click the link for the project$/) do
  find_link('Show', href: project_path(@project)).click
end

Then(/^I should see the details of my project$/) do
  save_and_open_page
  expect(page).to have_content "Name: #{@project.name}"
  expect(page).to have_content "Url: #{@project.url}"
end

Then(/^I should see a form to add a student$/) do
  expect(page).to have_selector('form#new_student')
end

When(/^I submit the form$/) do
  fill_in 'student_studentid', with: @student.studentid
  fill_in 'student_name', with: @student.name
  click_button 'Create Student'
end

And(/^I should see the student added to the project$/) do
  expect(page).to have_content "#{@student.studentid}"
  expect(page).to have_content "#{@student.name}"
end