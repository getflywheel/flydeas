require "rails_helper"

RSpec.describe MicropostsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/posts").to route_to("microposts#index")
    end

    it "routes to #new" do
      expect(:get => "/posts/new").to route_to("microposts#new")
    end

    it "routes to #show" do
      expect(:get => "/posts/1").to route_to("microposts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/posts/1/edit").to route_to("microposts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/posts").to route_to("microposts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/posts/1").to route_to("microposts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/posts/1").to route_to("microposts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/posts/1").to route_to("microposts#destroy", :id => "1")
    end

  end
end
