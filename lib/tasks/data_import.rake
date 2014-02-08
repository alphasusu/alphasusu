require 'csv'

desc "Import Course Reps"
task :import_coursereps => :environment do

  CourseRepresentative.destroy_all


  CSV.foreach(Rails.root.join('coursereps', 'facultyacademicofficers.csv')) do |row|
    if row[3] == "Faculty Officer"
      faculty = Faculty.find_or_create_by(name: row[4])
      if row[7].blank?
        next
      end
      user = User.find_or_create_by(email: row[7].split("@")[0])
      user.type = "LdapUser"
      user.save

      FacultyOfficer.create(user: user, faculty: faculty)
    elsif row[3] == "Academic President"
      academic_unit = AcademicUnit.find_or_create_by(name: row[4])
      faculty = Faculty.find_or_create_by(name: row[5])
      academic_unit.faculty = faculty
      academic_unit.save
      if row[7].blank?
        next
      end
      user = User.find_or_create_by(email: row[7].split("@")[0])
      user.type = "LdapUser"
      user.save
      
      AcademicPresident.create(user: user, academic_unit: academic_unit)
    else
      next
    end
  end
  
  CSV.foreach(Rails.root.join('coursereps', 'coursereps.csv'), headers: true) do |row|
    email = row[3]
    if !email.blank?
      user = User.find_or_create_by(email: row[3].split("@")[0])
      user.first_name = row[2]
      user.type = "LdapUser"
      user.save

      academic_unit = AcademicUnit.find_or_create_by(name: row[10])
      course = Course.find_or_create_by(name: row[1])
      course.academic_unit = academic_unit
      course.save
      courserep = CourseRepresentative.create(user: user, year: row[5], course: course)
    else
      course = Course.find_or_create_by(name: row[1])
    end



  end
end
