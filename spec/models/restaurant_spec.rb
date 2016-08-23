describe Restaurant, type: :model do

  it 'is not valid with a name of less than three characters' do
    restaurant = Restaurant.new(name: "kf")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it 'is not valid unless a unique name is used' do
    Restaurant.create(name: "Moe's Tavern")
    restaurant = Restaurant.create(name: "Moe's Tavern")
    expect(restaurant).to have(1).error_on(:name)
  end

end
