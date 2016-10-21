require 'rails_helper'

describe ClientsController do
	# get put post delete

	describe "GET new" do
		it "renders new template" do
			get :new
			expect(response).to render_template(:new)
		end

		it "assigns new client to @client" do
			get :new
			expect(assigns(:client)).to be_a_new(Client)
		end
	end

	describe "GET show" do
	let(:client)  {FactoryGirl.create(:client)}
		it "renders show template" do
			#get :show, id: client.id
			get :show, id: client

			expect(response).to render_template(:show)
		end

		it "assigns requested client to @client" do
			get :show, id: client
			expect(assigns(:client)).to eq(client)
		end
	end

	describe "POST create" do
		context "valid data" do
			let (:valid_data) { FactoryGirl.attributes_for(:client) }

			it "redirects to clients#show" do
				post :create, client: valid_data
				expect(response).to redirect_to(client_path(assigns[:client]))
			end

			it "creates new client in database" do
				expect{
					post :create, client: valid_data
				}.to change(Client, :count).by(1)
			end
		end
		context "invalid data" do
			let (:invalid_data) { FactoryGirl.attributes_for(:client, name: '') }
			let (:invalid_data2) { FactoryGirl.attributes_for(:client, street_address: '') }

			it "renders new template" do
				post :create, client: invalid_data
				expect(response).to render_template(:new)
			end
			it "renders new template#{2}" do
				post :create, client: invalid_data2
				expect(response).to render_template(:new)
			end
			it "does not creates new client in database" do
				expect{
					post :create, client: invalid_data
				}.not_to change(Client, :count)
			end
			it "does not creates new client in database#{2}" do
				expect{
					post :create, client: invalid_data2
				}.not_to change(Client, :count)
			end
		end
	end
end