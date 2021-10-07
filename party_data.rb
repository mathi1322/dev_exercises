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
# In a party, there are n people who can be uniquely identified as 0 to n-1. There is register which records the
#  timestamp whenever two persons meet. One person can meet another person multiple times throughout the party. 
# There is a chance that some of them never meet with each other. The logs are not sorted by any means. It is implied that A meets B is equal to B meets A.
# Write a program to find the earliest timestamp for any two given persons. If two persons never met, return -1.

def first_meet(m1, m2)
  data = $party_register.find_all do |met_time, person_1, person_2|
    [person_1, person_2].sort == [m1, m2].sort
  end
  return -1 if data.empty?
  data.min_by{ |x| x.first}.first
end
