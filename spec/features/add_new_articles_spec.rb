require 'rails_helper'

RSpec.feature "AddNewArticles", type: :feature do
  it "should require the user log in before adding an article" do
    password = "123456789"
    u = create( :user, password: password, password_confirmation: password )

    visit new_article_path

    within "#new_user" do
      fill_in "user_email", with: u.email
      fill_in "user_password", with: password
    end

    click_button "Log in"

    within "#new_article" do
      fill_in "article_title", with: "Article title"
      fill_in "article_content", with: "Hello everybody"
    end

    click_link_or_button "Create Article"

    expect( Article.count ).to eq(1)
    expect( Article.first.title).to eq("Article title")
  end

  it "should let a logged in user add an article" do
    login_as create( :user ), scope: :user

    visit new_article_path

    within "#new_article" do
      fill_in "article_title", with: "Article title"
      fill_in "article_content", with: "Hello everybody"
    end

    click_link_or_button "Create Article"

    expect( Article.count ).to eq(1)
    expect( Article.first.title).to eq("Article title")
  end
end
