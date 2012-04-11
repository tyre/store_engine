require "spec_helper"
describe "Categories, dawg. For sorting and sheeeeeeeet" do
  let!(:categories) do
    c = []
    5.times { c << Fabricate(:category) }
    c
  end
  before(:each) do
    visit "/categories"
  end

  it "displays a link to each category" do
    categories.each do |category|
      page.should have_link("#{category.name}", :href => category_path(category))
    end
  end

  it "has valid category links" do
    if categories.first
      click_link_or_button("#{categories.first.name}")
      page.should have_content("#{categories.first.name}")
    end
  end

  it "has a link to create a new category" do
    page.should have_link("New", :href => "/categories/new")
  end


end