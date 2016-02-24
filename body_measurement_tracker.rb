# Body measurements
require 'pry'
require 'yaml/store'
require 'date'

def prompt(msg)
  puts "=> #{msg}"
end

# Initialize the store.
# The file will be created if it doesn't exist.
store = YAML::Store.new('store.yml')


# Load data from the store.

body_weight_arr = store.transaction { store[:body_weight_hist] }

if body_weight_arr.nil?
  body_weight_arr = []
end

# def body_weight_hash(body_weight_lbs, current_date)
#   body_weight_hash = Hash.new do |hash, key|
#   hash[key] = body_weight_lbs
#   end
# end


# We could also use store.fetch, which does the same as Hash#fetch:
# Return the value if it exists, otherwise return the default value.
# data = store.transaction { store.fetch(:data, 'default value') }



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


# Store information entered into arrays or hashes or both
# Lets start with the body weight
# we want to capture the date and wieght

def welcome
  prompt "Welcome to My Body Measurement Tracker!"
end



def capture_date_and_weight(body_weight, current_date)
  body_weight[current_date]
end

# store the values into the yaml file
def store_weight_date(body_weight, current_date)
  body_weight << body_weight[current_date]
  store.transaction do
  store[:body_weight_hist] = body_weight
  end
end


def ask_for_date
  prompt "Would you like to use todays date?(y/n)"
  answer = gets.chomp.downcase

  if answer.include?("y")
  #if yes, use current date
  current_date = Date.today
  prompt "Great, we'll use todays date of #{current_date.to_s}."
  else
  # else prompt for use to enter date
  prompt "Please enter the day:"
  day = gets.chomp.to_i
  prompt "Please enter the month:"
  month = gets.chomp.to_i
  prompt "Please enter the year:"
  year = gets.chomp.to_i

  current_date = Date.new(year, month, day)
  end
  current_date
end

def ask_for_bw
  prompt "Please enter you body weight in pounds:"
  gets.chomp.to_f
end

def ask_for_bf
  prompt "Please enter your body fat percentage (optional):"
  gets.chomp.to_f
end

def another_entry?
  prompt "Would you like to make another entry?(y/n)"
  answer = gets.chomp
end

welcome

loop do

  current_date = ask_for_date
  # binding.pry

  body_weight_lbs = ask_for_bw

  body_fat = ask_for_bf

  # capture_date_and_weight(body_weight, current_date)

  # store_weight_date(body_weight, current_date)
  body_weight_hash = {current_date => body_weight_lbs, body_fat: body_fat}

  body_weight_arr << body_weight_hash
  store.transaction do
  store[:body_weight_hist] = body_weight_arr
  end
  break unless another_entry?.downcase.include?("y")

end

prompt "Thank you for using My Body Measurement Tracker!"
