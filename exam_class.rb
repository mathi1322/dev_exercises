require 'json'

def data
  file = File.read('./exam_result.json')
  JSON.parse(file)
end

def class_wise_data
  data.group_by{|x| x["Class"]}
end

def pass_count(subject)
  subj = class_wise_data.map{|key,value| [key, value.map{|x| x[subject]}]}.to_h
  subj.map{|key,value| [key, value.select{|x| x>=35}.count]}.to_h
end

def fail_count(subject)
  subj = class_wise_data.map{|key,value| [key, value.map{|x| x[subject]}]}.to_h
  subj.map{|key,value| [key, value.select{|x| x<35}.count]}.to_h
end

def top_rank
  class_wise_data.map { |key,value| 
    top_student = value.max_by{ |x| 
      x["Tamil"]+x["English"]+x["Maths"]+x["Science"]+x["Social"]
    }
    [key, top_student]
  }.to_h
end

def gender_by_top_rank
  gender_by_data = class_wise_data.map{|key,value| [key, value.group_by{|x| x["gender"]}]}.to_h
  gender_by_data.map{|key,value| [key,value.map{|key,value| [key,value.max_by{|x| x["Tamil"]+x["English"]+x["Maths"]+x["Science"]+x["Social"]}]}]}.to_h
end