require 'rails_helper'

describe ArticlesController, type: :controller do
  describe "anonymous user" do
    before :each do
      # This simulates an anonymous user
      login_with nil
    end

    it "should be redirected to signin" do
      get :new
      expect( response ).to redirect_to( new_user_session_path )
    end

    it "should let an anonymous user see all the posts" do
      get :index
      expect( response ).to render_template( :index )
    end

    it "should let a logged in user write a post" do
      login_with create( :user )
      get :new
      expect( response ).to render_template( :new )
    end
  end
end