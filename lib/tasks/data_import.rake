require 'csv'

desc "Import Course Reps"
task :import_coursereps => :environment do

  CourseRepresentation.destroy_all
  CourseRepresentative.destroy_all
  Course.destroy_all
  
  CSV.foreach(Rails.root.join('coursereps', 'coursereps.csv'), headers: true) do |row|
    email = row[3]
    if email.blank?
      next
    end

    user = User.find_or_create_by(email: row[3].split("@")[0])
    course = Course.find_or_create_by(name: row[1])
    courserep = CourseRepresentative.create(user: user)
    courselink = CourseRepresentation.create(course: course, course_representative: courserep, year:row[5])
  end
end
