FactoryBot.define do
  factory :work_time do
    institution_id 1
    mondeyWork false
    mondeyStart "08:00"
    mondeyEnd "20:00"

    tuesdayWork false
    tuesdayStart "08:00"
    tuesdayEnd "20:00"

    wednesdayWork false
    wednesdayStart "08:00"
    wednesdayEnd "20:00"

    thursdayWork false
    thursdayStart "08:00"
    thursdayEnd "20:00"

    fridayWork false
    fridayStart "08:00"
    fridayEnd "20:00"

	saturdayWork false
    saturdayStart "08:00"
    saturdayEnd "20:00"

    sundayWork false
    sundayStart "08:00"
    sundayEnd "20:00"
  end
end
