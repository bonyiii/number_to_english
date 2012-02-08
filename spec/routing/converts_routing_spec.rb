require "spec_helper"

describe ConvertsController do
  describe "routing" do

    it "routes to #index" do
      get("/converts").should route_to("converts#index")
    end

    it "routes to #new" do
      get("/converts/new").should route_to("converts#new")
    end

    it "routes to #show" do
      get("/converts/1").should route_to("converts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/converts/1/edit").should route_to("converts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/converts").should route_to("converts#create")
    end

    it "routes to #update" do
      put("/converts/1").should route_to("converts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/converts/1").should route_to("converts#destroy", :id => "1")
    end

  end
end
