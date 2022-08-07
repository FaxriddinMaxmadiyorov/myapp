namespace :active_record_counter do
  desc "TODO"
  task students_count: :environment do
    puts "Students count = #{Student.count}"
  end

  desc "TODO"
  task courses_count: :environment do
    puts "Courses count = #{Course.count}"
  end

  desc "TODO"
  task blogs_count: :environment do
    puts "Blogs count = #{Blog.count}"
  end

end
