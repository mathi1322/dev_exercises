require 'byebug'
require 'json'
require_relative '/home/mathivanan/git/temp/exam_class.rb'

file = File.read('./exam_result.json')
exam_data = JSON.parse(file)

# 1) Students who scared high marks in Maths
# Complexity - O(2n)
maths_highscore = exam_data.max_by {|x| x["Maths"]}
students = exam_data.find_all{ |x| x["Maths"] == maths_highscore["Maths"]}
student_names = students.map{|x| x["first_name"]}
puts "#{student_names} are scored high mark - #{maths_highscore["Maths"]} in maths"
puts ""

# 2) class wise - in every subject - number of pass and fail 
puts "Subject wise pass_counts in form of: class => pass_counts" 
print "Tamil: " 
puts ExamData.pass_count("Tamil")
print "English: " 
puts ExamData.pass_count("English")
print "Maths: " 
puts ExamData.pass_count("Maths")
print "Science: " 
puts ExamData.pass_count("Science")
print "Social: " 
puts ExamData.pass_count("Social")
puts "Subject wise fail_counts in form of: class => fail_counts" 
print "Tamil: " 
puts ExamData.fail_count("Tamil")
print "English: " 
puts ExamData.fail_count("English")
print "Maths: " 
puts ExamData.fail_count("Maths")
print "Science: " 
puts ExamData.fail_count("Science")
print "Social: "
puts ExamData.fail_count("Social")
puts ""

# 3) class wise - top rank
# ExamData.top_rank[class_wise] return the top rank student data of particular class
puts ExamData.top_rank
puts ""

# 4) class wise - top rank - by gender
# ExamData.gender_by_top_rank[class_wise] return the top rank students data by gender of particular class
puts ExamData.gender_by_top_rank
puts ""
