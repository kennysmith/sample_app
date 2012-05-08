require "spec_helper"

describe SendeventsController do
  describe "routing" do

    it "routes to #index" do
      get("/sendevents").should route_to("sendevents#index")
    end

    it "routes to #new" do
      get("/sendevents/new").should route_to("sendevents#new")
    end

    it "routes to #show" do
      get("/sendevents/1").should route_to("sendevents#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sendevents/1/edit").should route_to("sendevents#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sendevents").should route_to("sendevents#create")
    end

    it "routes to #update" do
      put("/sendevents/1").should route_to("sendevents#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sendevents/1").should route_to("sendevents#destroy", :id => "1")
    end

  end
end
