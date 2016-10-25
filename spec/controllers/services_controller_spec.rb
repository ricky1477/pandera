require 'rails_helper'

describe ServicesController do

	describe "guest admin" do
		describe "GET index" do
			it "renders :index template" do
				get :index
				expect(response).to render_template(:index)
			end
		end

		describe "GET show" do
			let(:client)  {FactoryGirl.create(:client)}
			let(:service)  {FactoryGirl.create(:service, client_id: client.id)}

			it "renders :show template" do
				get :show, id: service
				expect(response).to render_template(:show)
			end

			it "assigns requested service to @service" do
				get :show, id: service
				expect(assigns(:service)).to eq(service)
			end
		end

		describe "GET edit" do
			let(:client)  {FactoryGirl.create(:client)}
			let(:service)  {FactoryGirl.create(:service, client_id: client.id)}

			it "renders :edit template" do
				get :edit, id: service
				# Take locale param off of new_admin_session_path
				expect(response).to redirect_to( new_admin_session_path.slice(0..(new_admin_session_path.index('?')-1)) )
			end

			it "assigns the requested service to template" do
				get :edit, id: service
				expect(assigns(:service)).to eq(service)
			end
		end

		describe "GET new" do
			it "redirects to login page" do
				get :new
				expect(response).to redirect_to( new_admin_session_path.slice(0..(new_admin_session_path.index('?')-1)) )
			end
		end

		describe "POST create" do
			let(:client)  {FactoryGirl.create(:client)}

			it "redirects to login page" do
				post :create, service: FactoryGirl.attributes_for(:service, client_id: client.id)
				expect(response).to redirect_to( new_admin_session_path.slice(0..(new_admin_session_path.index('?')-1)) )
			end
		end

		describe "GET edit" do
			let(:client)  {FactoryGirl.create(:client)}

			it "redirects to login page" do
				get :edit, id: FactoryGirl.create(:service, client_id: client.id)
				expect(response).to redirect_to( new_admin_session_path.slice(0..(new_admin_session_path.index('?')-1)) )
			end
		end

		describe "PUT update" do
			let(:client)  {FactoryGirl.create(:client)}

			it "redirects to login page" do
				put :update, id: FactoryGirl.create(:service, client_id: client.id), service: FactoryGirl.attributes_for(:service, client_id: client.id)
				expect(response).to redirect_to( new_admin_session_path.slice(0..(new_admin_session_path.index('?')-1)) )
			end
		end

		describe "DELETE destory" do
			let(:client)  {FactoryGirl.create(:client)}

			it "redirects to login page" do
				delete :destroy, id: FactoryGirl.create(:service, client_id: client.id)
				expect(response).to redirect_to( new_admin_session_path.slice(0..(new_admin_session_path.index('?')-1)) )
			end
		end
	end

	describe "authenticated admin" do
		let(:admin) {FactoryGirl.create(:admin)}

		before do
			sign_in(admin)
		end

		describe "GET index" do
			it "renders :index template" do
				get :index
				expect(response).to render_template(:index)
			end
		end

		describe "GET show" do
			let(:client)  {FactoryGirl.create(:client)}
			let(:service)  {FactoryGirl.create(:service, client_id: client.id)}

			it "renders :show template" do
				get :show, id: service
				expect(response).to render_template(:show)
			end

			it "assigns requested service to @service" do
				get :show, id: service
				expect(assigns(:service)).to eq(service)
			end
		end

		describe "GET new" do
			it "renders :new template" do
				get :new
				expect(response).to render_template(:new)
			end

			it "assigns new service to @service" do
				get :new
				expect(assigns(:service)).to be_a_new(Service)
			end
		end

		describe "POST create" do
			context "valid data" do
				let(:client)  {FactoryGirl.create(:client)}
				let (:valid_data) { FactoryGirl.attributes_for(:service, client_id: client.id) }

				it "redirects to services#show" do
					post :create, service: valid_data
					expect(response).to redirect_to(service_path(assigns[:service]))
				end

				it "creates new service in database" do
					expect{
						post :create, service: valid_data
					}.to change(Client, :count).by(1)
				end
			end
			context "invalid data" do
				let (:invalid_data) { FactoryGirl.attributes_for(:service, name: '') }
				let (:invalid_data2) { FactoryGirl.attributes_for(:service, street_address: '') }

				it "renders :new template" do
					post :create, service: invalid_data
					expect(response).to render_template(:new)
				end
				it "renders :new template#{2}" do
					post :create, service: invalid_data2
					expect(response).to render_template(:new)
				end
				it "does not creates new service in database" do
					expect{
						post :create, service: invalid_data
					}.not_to change(Client, :count)
				end
				it "does not creates new service in database#{2}" do
					expect{
						post :create, service: invalid_data2
					}.not_to change(Client, :count)
				end
			end
		end

		describe "PUT update" do
			let(:client)  {FactoryGirl.create(:client)}
			let(:service)  {FactoryGirl.create(:service, client_id: client.id)}

			context "valid data" do
				let (:valid_data) { FactoryGirl.attributes_for(:service, description: 'newDescription') }

				it "redirects to services#show" do
					put :update, id: service, service: valid_data
					expect(response).to redirect_to(service)
				end

				it "updates service in database" do
					put :update, id: service, service: valid_data
					service.reload
					expect(service.description).to eq('newDescription')
				end
			end
			context "invalid data" do
				let (:invalid_data) { FactoryGirl.attributes_for(:service, client_id: '') }
				let (:invalid_data2) { FactoryGirl.attributes_for(:service, price: '') }

				it "renders :edit template" do
					put :update, id: service, service: invalid_data
					expect(response).to render_template(:edit)
				end
				it "renders :edit template#{2}" do
					put :update, id: service, service: invalid_data2
					expect(response).to render_template(:edit)
				end
				it "does not creates new service in database" do
					put :update, id: service, service: invalid_data
					service.reload
					expect(service.description).not_to eq('testDescription')
				end
				it "does not creates new service in database#{2}" do
					put :update, id: service, service: invalid_data2
					service.reload
					expect(service.price).not_to eq('testPrice')
				end
			end
		end

		describe "DELETE destroy" do
			let(:client)  {FactoryGirl.create(:client)}
			let(:service)  {FactoryGirl.create(:service, client_id: client.id)}

			it "redirects to services#index" do
				delete :destroy, id: service
				expect(response).to redirect_to(services_path)
			end

			it "deletes services from db" do
				delete :destroy, id: service
				expect(Service.exists?(service.id)).to be_falsy
			end
		end
	end
end