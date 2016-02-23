# Body measurements
require 'date'
require 'yaml/store'

# Initialize the store.
# The file will be created if it doesn't exist.
store = YAML::Store.new('store.yml')

# Load data from the store.
body_weight = store.transaction { store[:body_weight] }
# We could also use store.fetch, which does the same as Hash#fetch:
# Return the value if it exists, otherwise return the default value.
# data = store.transaction { store.fetch(:data, 'default value') }


store.transaction do
  store["Body weight2"] = body_weight
end


# # Capture the date
# current_date
# user_defined_date

# # BODY WEIGHT MEASUREMENT
# body_weight_lbs
# fat_percentage

# # GIRTH MEASUREMENTS

# Neck Girth
# Shoulder Girth
# Chest Girth
# Upper Arm Girth
# Waist Girth
# Hip Girth
# Thigh Girth
# Calf Girth


def prompt(msg)
  puts "=> #{msg}"
end

prompt "Welcome to Body Measurement Tracker!"
prompt "Would you like to use todays date?(y/n)"
answer = gets.chomp.downcase

if answer.include?("y")
#if yes, use current date
current_date = Date.today.to_s

prompt "Great, we'll use todays date of #{current_date.to_s}."
else
# else prompt for use to enter date
prompt "Please enter the day:"
day = gets.chomp.to_i
prompt "Please enter the month:"
month = gets.chomp.to_i
prompt "Please enter the month:"
year = gets.chomp.to_i

user_defined_date = Date.new(year, month, day)
end


prompt "Please enter you body weight in pounds:"
body_weight_lbs = gets.chomp.to_f

prompt "Please enter your body fat percentage (optional):"
fat_percentage = gets.chomp.to_f

# Store information entered into arrays or hashes or both
# Lets start with the body weight
# we want to capture the date and wieght

track_body_weight = Hash.new { |hash, key| hash[key] = body_weight_lbs }
track_body_weight[current_date]





prompt "Thank you for using Body Measurement Tracker!"
