require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/tasks", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Task. As you add validations to Task, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { title: 'Reading Japanese' } }
  let(:invalid_attributes) { { title: '', minutes: -1 } }

  let(:korean_label) { create(:label, title: 'korean') }
  let(:read_label) { create(:label, title: 'read') }
  let(:task_one_label) { { title: 'Reading Korean', labels: [korean_label] } }
  let(:task_two_labels) { { title: 'Reading Korean', labels: [korean_label, read_label] } }


  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # TasksController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      get tasks_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      task = Task.create! valid_attributes
      get task_url(task), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Task with no labels" do
        expect {
          post tasks_url,
               params: { task: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Task, :count).by(1)
      end

      it "creates a new Task with one labels" do
        expect {
          post tasks_url,
               params: { task: task_one_label }, headers: valid_headers, as: :json
        }.to change(Task, :count).by(1)
      end

      it "creates a new Task with two labels" do
        expect {
          post tasks_url,
               params: { task: task_two_labels }, headers: valid_headers, as: :json
        }.to change(Task, :count).by(1)
      end

      pending 'creates a new Task with a new label and add another that already exists'

      it "renders a JSON response with the new task" do
        post tasks_url,
             params: { task: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Task" do
        expect {
          post tasks_url,
               params: { task: invalid_attributes }, as: :json
        }.to change(Task, :count).by(0)
      end

      it "renders a JSON response with errors for the new task" do
        post tasks_url,
             params: { task: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { title: 'Reading Korean', minutes: 30 }
      }

      it "updates the requested task" do
        task = Task.create! valid_attributes
        patch task_url(task),
              params: { task: new_attributes }, headers: valid_headers, as: :json
        task.reload
        expect({ title: task.title, minutes: task.minutes }).to eq(new_attributes)
      end

      it "renders a JSON response with the task" do
        task = Task.create! valid_attributes
        patch task_url(task),
              params: { task: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the task" do
        task = Task.create! valid_attributes
        patch task_url(task),
              params: { task: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    # Currently if you destroy a task, it is still being referenced on task_labels
    # You need to also destroy that instance with dependent destroy
    it "destroys the requested task with no labels" do
      task = Task.create! valid_attributes
      expect {
        delete task_url(task), headers: valid_headers, as: :json
      }.to change(Task, :count).by(-1)
    end

    it "destroys the requested task with labels" do
      task = Task.create! task_two_labels
      expect {
        delete task_url(task), headers: valid_headers, as: :json
      }.to change(Task, :count).by(-1)
    end
  end
end
