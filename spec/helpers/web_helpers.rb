def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: 'test@example.com'
  fill_in 'Password', with: 'Password123'
  fill_in 'Password confirmation', with: 'Password123'
  click_button 'Sign up'
end
