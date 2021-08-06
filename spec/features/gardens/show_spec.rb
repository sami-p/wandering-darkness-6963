require 'rails_helper'

RSpec.describe 'The Garden Show page' do
  before :each do
    @garden = Garden.create!(name: "Summer Garden", organic: true)

    @plot_1 = @garden.plots.create!(number: 1, size: "Medium", direction: "West")
    @plot_2 = @garden.plots.create!(number: 2, size: "Large", direction: "East")
    @plot_3 = @garden.plots.create!(number: 3, size: "Small", direction: "North")
    @plot_4 = @garden.plots.create!(number: 4, size: "Small", direction: "South")
    @plot_5 = @garden.plots.create!(number: 5, size: "Large", direction: "North")

    @plant_1 = @plot_1.plants.create!(name: "Basil", description: "Greatest thing on earth.", days_to_harvest: 10)
    @plant_2 = @plot_1.plants.create!(name: "Rutabega", description: "No one eats these.", days_to_harvest: 11)
    @plant_3 = @plot_2.plants.create!(name: "Rutabega", description: "No one eats these.", days_to_harvest: 12)
    @plant_4 = @plot_2.plants.create!(name: "Tomato", description: "Not very good unless covered in mozarella.", days_to_harvest: 13)
    @plant_5 = @plot_3.plants.create!(name: "Basil", description: "Greatest thing on earth.", days_to_harvest: 14)
    @plant_6 = @plot_3.plants.create!(name: "Rutabega", description: "No one eats these", days_to_harvest: 15)
    @plant_7 = @plot_4.plants.create!(name: "Potato", description: "To make fries.", days_to_harvest: 140)
    @plant_8 = @plot_4.plants.create!(name: "Lettuce", description: "NOT the devil's lettuce. Get your mind out of the gutter.", days_to_harvest: 130)
    @plant_9 = @plot_5.plants.create!(name: "Cilantro", description: "Tastes like soap.", days_to_harvest: 120)

    visit "/gardens/#{@garden.id}"
  end
  # As a visitor
  # When I visit an garden's show page
  # Then I see a list of plants that are included in that garden's plots
  # And I see that this list is unique (no duplicate plants)
  # And I see that this list only includes plants that take less than 100 days to harvest

  it 'displays a unique list of plants that are included in that gardens plots' do
    expect(page).to have_content(@plant_1.name)
    expect(page).to have_content(@plant_2.name)
    expect(page).to have_content(@plant_4.name)
    expect(page).to have_content(@plant_7.name)
    expect(page).to have_content(@plant_8.name)
    expect(page).to have_content(@plant_9.name)
    expect(page).to_not have_content(@plant_3.name)
    expect(page).to_not have_content(@plant_5.name)
    expect(page).to_not have_content(@plant_6.name)
  end

  xit 'only displays plants that take less than 100 days to harvest' do
  end
end
