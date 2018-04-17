FactoryGirl.define do

  factory :admin_role, class: :role do
    name 'Admin'
  end

  factory :member_role, class: :role do
    name 'Member'
  end

  factory :student_role, class: :role do
    name 'Student'
  end

  factory :admin, class: User do
    username "admin"
    email "admin@ait.asia"
    password "admin123"
    password_confirmation "admin123"
    role {FactoryGirl.create(:admin_role)}
  end

  factory :teacher, class: User do
    username "nam"
    email "nam_teacher@ait.asia"
    password "password"
    password_confirmation "password"
    role {FactoryGirl.create(:member_role)}
  end

  factory :student, class: User do
    username "student"
    email "student@ait.asia"
    password "student123"
    password_confirmation "student123"
    role {FactoryGirl.create(:student_role)}
  end

  factory :st119000, class: User do
    username "taylor"
    email "st119000@ait.asia"
    password "st119000"
    password_confirmation "st119000"
    role {FactoryGirl.create(:student_role)}
  end

  factory :category, class: Category do
    name "Computer Science"
  end
  factory :course, class: Course do
    title "SDQI"
    user {FactoryGirl.create(:teacher)}
    category {FactoryGirl.create(:category)}
  end


end