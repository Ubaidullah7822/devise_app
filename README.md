
# Ruby version
* `2.4.1`

# Rails version
* `5.1.4`

# Introduction
This project can be used to implement Admin Panel with multiple admin users having different levels of accessibility and authority. You can dynamically manage admin-users access for tabs and actions e.g. (CRUD operations). 

# Pre-Requisite
* Active Admin gem is setup
* Devise gem is setup
* Now, you have active admin up & running. you can see admin_user model crated by active admin. you can have multiple models   linked with active admin. now let's move to the real work. 

# Configuration
* Create a model named "Tab" to store name of tabs appearing in active admin.
* Create a middle model between AdminUser and Tab.
* Add a column for defining accessibility between users & tabs (allowed_actions: "Read/Write")

# Associations are as followed:
* AdminUser has many AdminUserTabs(Middle table name)
* AdminUser has many Tabs through AdminUserTabs
* Tab can have many AdminUserTabs
* Tab can have many AdminUsers through AdminUserTabs

# Format of Saving Name in Tab Model
* Model Name: (User => "User")
* Model Name: (Admin User => "AdminUser")

# Setup Project
* Run Seed file to setup dummy data
  # Note: 
  * Change Tab names according to your tabs considering format described above.
 
# To read code
* app/model/admin_user.rb
* app/helpers/admin_helper.rb


* ...
