require 'rails_helper'

RSpec.describe 'The Plot Index page' do

  before :each do
    @garden_1 = Garden.create!(name: "Summer Garden", organic: true)
    @garden_2 = Garden.create!(name: "Winter Garden", organic: true)

    @plot_1 = @garden_1.plots.create!(number: 1, size: "Medium", direction: "West")
    @plot_2 = @garden_1.plots.create!(number: 2, size: "Large", direction: "East")
    @plot_3 = @garden_1.plots.create!(number: 3, size: "Small", direction: "North")

    @plot_4 = @garden_2.plots.create!(number: 4, size: "Small", direction: "South")
    @plot_5 = @garden_2.plots.create!(number: 5, size: "Large", direction: "North")

    @plant_1 = @plot_1.plants.create!(name: "Carrot", description: "What's up doc?", days_to_harvest: 10)
    @plant_2 = @plot_1.plants.create!(name: "Beet", description: "Battlestar Galactica.", days_to_harvest: 11)
    @plant_3 = @plot_2.plants.create!(name: "Rutabega", description: "No one eats these.", days_to_harvest: 12)
    @plant_4 = @plot_2.plants.create!(name: "Tomato", description: "Not very good unless covered in mozarella.", days_to_harvest: 13)
    @plant_5 = @plot_3.plants.create!(name: "Basil", description: "Greatest thing on earth.", days_to_harvest: 14)
    @plant_6 = @plot_3.plants.create!(name: "Pumpkin", description: "Halloween only.", days_to_harvest: 15)
    @plant_7 = @plot_4.plants.create!(name: "Potato", description: "To make fries.", days_to_harvest: 16)
    @plant_8 = @plot_4.plants.create!(name: "Lettuce", description: "NOT the devil's lettuce. Get your mind out of the gutter.", days_to_harvest: 17)
    @plant_9 = @plot_5.plants.create!(name: "Cilantro", description: "Tastes like soap.", days_to_harvest: 18)

    visit '/plots'
  end

  # As a visitor
  # When I visit the plots index page ('/plots')
  # I see a list of all plot numbers
  # And under each plot number I see names of all that plot's plants

  it 'displays a list of all plot numbers' do
    expect(page).to have_content(@plot_1.number)
    expect(page).to have_content(@plot_2.number)
    expect(page).to have_content(@plot_3.number)
    expect(page).to have_content(@plot_4.number)
    expect(page).to have_content(@plot_5.number)
  end

  it 'displays all plant names belonging to each plot' do
    expect(page).to have_content(@plant_1.name)
    expect(page).to have_content(@plant_2.name)
    expect(page).to have_content(@plant_3.name)
    expect(page).to have_content(@plant_4.name)
    expect(page).to have_content(@plant_5.name)
    expect(page).to have_content(@plant_6.name)
    expect(page).to have_content(@plant_7.name)
    expect(page).to have_content(@plant_8.name)
    expect(page).to have_content(@plant_9.name)
  end

  # As a visitor
  # When I visit a plot's index page
  # Next to each plant's name
  # I see a link to remove that plant from that plot
  # When I click on that link
  # I'm returned to the plots index page
  # And I no longer see that plant listed under that plot
  # (Note: you should not destroy the plant record entirely)

  it 'displays a link next to each plant to remove it from the plot' do
    click_link("Remove #{@plant_3.name}")

    expect(current_path).to eq("/plots")
    expect(page).to_not have_content(@plant_3.name)
  end
end
