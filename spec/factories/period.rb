FactoryGirl.define do
  factory(:period) do
    number 1
    text "Period 1"
    start "07:32"
    finish "08:14"

    schedule
  end
end