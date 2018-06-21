require "rails_helper"

RSpec.describe MicropostsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/microposts").to route_to("microposts#index")
    end

    it "routes to #new" do
      expect(:get => "/microposts/new").to route_to("microposts#new")
    end

    it "routes to #show" do
      expect(:get => "/microposts/1").to route_to("microposts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/microposts/1/edit").to route_to("microposts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/microposts").to route_to("microposts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/microposts/1").to route_to("microposts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/microposts/1").to route_to("microposts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/microposts/1").to route_to("microposts#destroy", :id => "1")
    end

  end
end
