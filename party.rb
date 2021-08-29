$party_register = [
  [202108161120, 4, 1],
  [202108161115, 1, 4],
  [202108161118, 2, 1],
  [202108161111, 0, 1],
  [202108161110, 2, 1],
  [202108161118, 3, 2],
  [202108161116, 2, 1],
  [202108161113, 4, 1],
  [202108161118, 1, 3]
]

# name should be descriptive
# logic should be readable
# Complexity

# In a party, there are n people who can be uniquely identified as 0 to n-1. There is register which records the
#  timestamp whenever two persons meet. One person can meet another person multiple times throughout the party. 
# There is a chance that some of them never meet with each other. The logs are not sorted by any means. It is implied that A meets B is equal to B meets A.
# Write a program to find the earliest timestamp for any two given persons. If two persons never met, return -1.
def first_meeting_time_of(a,b)
  sorted_party_data = $party_register.map{|data| data.sort}
  if sorted_party_data.find do |(person_1,person_2,met_time)| 
      person_1 == [a,b].min && person_2 == [a,b].max
    end
    data_of_given_two_people = sorted_party_data.select do |(person_1,person_2,met_time)| 
      person_1 == [a,b].min && person_2 == [a,b].max
    end
  data_of_given_two_people.map {|(person_1,person_2,met_time)| met_time}.min
  elsif sorted_party_data.find do |(person_1,person_2,met_time)|
      (person_1 == [a,b].min && person_2 != [a,b].max) || (person_1!=[a,b].min && person_2 == [a,b].max)
    end 
    -1
  elsif sorted_party_data.find do |(person_1,person_2,met_time)| 
      !(person_1 == [a,b].min && person_2 == [a,b].max)
    end
    raise StandardError.new("There is no data for them on the register")
  end
end

def run_tests
  first_meeting_time = first_meeting_time_of(1, 2) == 202108161110
  first_meeting_time_no_order = first_meeting_time_of(2, 1) == 202108161110
  people_never_met = first_meeting_time_of(4, 3) == -1
  raises_standard_error = (first_meeting_time_of(15, 1025) rescue "Error") == "Error"
  tests = [
    first_meeting_time,
    first_meeting_time_no_order,
    people_never_met,
    raises_standard_error
  ]
  puts "picks the  earliest time when two people met: #{first_meeting_time}"
  puts "picks the earliest time when two people met in different order: #{first_meeting_time_no_order}"
  puts "Returns -1 if two people never met: #{people_never_met}"
  puts "If the given two people not on the register: #{raises_standard_error}"
  passing = tests.filter(&:itself).size
  failing = tests.reject(&:itself).size
  puts "-----------------"
  puts "#{passing} passing."
  puts "#{failing} failing."
  puts "-----------------"
end
run_tests
