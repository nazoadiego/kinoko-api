require "rails_helper"

RSpec.describe WorkSessionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/work_sessions").to route_to("work_sessions#index")
    end

    it "routes to #show" do
      expect(get: "/work_sessions/1").to route_to("work_sessions#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/work_sessions").to route_to("work_sessions#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/work_sessions/1").to route_to("work_sessions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/work_sessions/1").to route_to("work_sessions#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/work_sessions/1").to route_to("work_sessions#destroy", id: "1")
    end
  end
end
