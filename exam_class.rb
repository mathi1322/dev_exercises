require 'json'
module ExamData 
  def self.pass_count(subject)
    file = File.read('./exam_result.json')
    exam_data = JSON.parse(file)
    class_wise_data = exam_data.group_by{|x| x["Class"]}
    subj = class_wise_data.map{|key,value| [key, value.map{|x| x[subject]}]}.to_h
    subj.map{|key,value| [key, value.select{|x| x>=35}.count]}.to_h
  end
  
  def self.fail_count(subject)
    file = File.read('./exam_result.json')
    exam_data = JSON.parse(file)
    class_wise_data = exam_data.group_by{|x| x["Class"]}
    subj = class_wise_data.map{|key,value| [key, value.map{|x| x[subject]}]}.to_h
    subj.map{|key,value| [key, value.select{|x| x<35}.count]}.to_h
  end

  def self.top_rank
    file = File.read('./exam_result.json')
    exam_data = JSON.parse(file)
    class_wise_data = exam_data.group_by{|x| x["Class"]}
    class_wise_data.map{|key,value| [key, value.max_by{|x| x["Tamil"]+x["English"]+x["Maths"]+x["Science"]+x["Social"]}]}.to_h
  end

  def self.gender_by_top_rank
    file = File.read('./exam_result.json')
    exam_data = JSON.parse(file)
    class_wise_data = exam_data.group_by{|x| x["Class"]}
    gender_by_data = class_wise_data.map{|key,value| [key, value.group_by{|x| x["gender"]}]}.to_h
    gender_by_data.map{|key,value| [key,value.map{|key,value| [key,value.max_by{|x| x["Tamil"]+x["English"]+x["Maths"]+x["Science"]+x["Social"]}]}]}.to_h
  end
end