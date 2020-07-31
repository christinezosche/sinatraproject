# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app: This app was built with Sinatra; see environment.rb, Gemfile, and application_controller.rb.
- [x] Use ActiveRecord for storing information in a database: ActiveRecord was used to store information and build models; see environment.rb, Gemfile, db folder, and models folder.
- [x] Include more than one model class (e.g. User, Post, Category): Two models were used; a User model and a Flight model.
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts): The User model has_many Flights.
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User): The Flight model belongs_to User.
- [x] Include user accounts with unique login attribute (username or email): User accounts can be created with a unique username attribute; see user_controller.rb.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying: The Flight controller has routes to create a new flight, display all flights, display each flight, edit a flight, and delete a flight. The User controller has a route to display a user's flights; see flight_controller.rb and user_controller.rb.
- [x] Ensure that users can't modify content created by other users: The main Application controller has helper methods to verify the user so that a user can only edit or delete their own flights; see application_controller.rb and flight_controller.rb.
- [x] Include user input validations: The User controller 'signup' and 'login' routes feature verification methods; see user_controller.rb. The forms to create and edit flights specify "required" in their html code; see the views/flights folder.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new): See date_error.erb, edit_date_error.erb, edit_flight_error.erb, flight_error.erb, login_error.erb, signup_error.erb, and username_error.erb.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code: See README.md.

Confirm
- [x] You have a large number of small Git commits: See https://github.com/christinezosche/sinatraproject
- [x] Your commit messages are meaningful: See https://github.com/christinezosche/sinatraproject
- [x] You made the changes in a commit that relate to the commit message: See https://github.com/christinezosche/sinatraproject
- [x] You don't include changes in a commit that aren't related to the commit message: See https://github.com/christinezosche/sinatraproject
