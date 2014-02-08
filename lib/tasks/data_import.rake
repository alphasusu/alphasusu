require 'csv'

desc "Import Course Reps"
task :import_coursereps => :environment do

  CourseRepresentative.destroy_all
  Course.destroy_all
  
  CSV.foreach(Rails.root.join('coursereps', 'coursereps.csv'), headers: true) do |row|
    email = row[3]
    if email.blank?
      next
    end

    user = User.find_or_create_by(email: row[3].split("@")[0])
    user.first_name = row[2]
    user.save
    course = Course.find_or_create_by(name: row[1])
    courserep = CourseRepresentative.create(user: user, year: row[5], course: course)
  end
end
