FactoryGirl.define do
  factory(:schedule) do
    name 'Foobar'
    description 'Foo to the bar.'

    trait(:active) do
      active true
    end
  end
end
