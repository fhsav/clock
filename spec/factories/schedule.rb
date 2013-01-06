FactoryGirl.define do
  factory(:schedule) do
    name "Foobar"
    description "Foo to the bar."

    periods { [ FactoryGirl.build(:period) ] }

    trait(:activated) do
      active true
    end
  end
end