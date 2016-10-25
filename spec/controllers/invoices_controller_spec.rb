require 'rails_helper'

describe InvoicesController do

	describe "guest admin" do
		describe "GET index" do
			it "renders :index template" do
				get :index
				expect(response).to render_template(:index)
			end
		end

		describe "GET show" do
			let(:client)  {FactoryGirl.create(:client)}
			let(:invoice)  {FactoryGirl.create(:invoice, client_id: client.id)}

			it "renders :show template" do
				get :show, id: invoice
				expect(response).to render_template(:show)
			end

			it "assigns requested invoice to @invoice" do
				get :show, id: invoice
				expect(assigns(:invoice)).to eq(invoice)
			end
		end

		describe "GET edit" do
			let(:client)  {FactoryGirl.create(:client)}
			let(:invoice)  {FactoryGirl.create(:invoice, client_id: client.id)}

			it "renders :edit template" do
				get :edit, id: invoice
				# Take locale param off of new_admin_session_path
				expect(response).to redirect_to( new_admin_session_path.slice(0..(new_admin_session_path.index('?')-1)) )
			end

			it "assigns the requested invoice to template" do
				get :edit, id: invoice
				expect(assigns(:invoice)).to eq(invoice)
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
				post :create, invoice: FactoryGirl.attributes_for(:invoice, client_id: client.id)
				expect(response).to redirect_to( new_admin_session_path.slice(0..(new_admin_session_path.index('?')-1)) )
			end
		end

		describe "GET edit" do
			let(:client)  {FactoryGirl.create(:client)}

			it "redirects to login page" do
				get :edit, id: FactoryGirl.create(:invoice, client_id: client.id)
				expect(response).to redirect_to( new_admin_session_path.slice(0..(new_admin_session_path.index('?')-1)) )
			end
		end

		describe "PUT update" do
			let(:client)  {FactoryGirl.create(:client)}

			it "redirects to login page" do
				put :update, id: FactoryGirl.create(:invoice, client_id: client.id), invoice: FactoryGirl.attributes_for(:invoice, client_id: client.id)
				expect(response).to redirect_to( new_admin_session_path.slice(0..(new_admin_session_path.index('?')-1)) )
			end
		end

		describe "DELETE destory" do
			let(:client)  {FactoryGirl.create(:client)}

			it "redirects to login page" do
				delete :destroy, id: FactoryGirl.create(:invoice, client_id: client.id)
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
			let(:invoice)  {FactoryGirl.create(:invoice, client_id: client.id)}

			it "renders :show template" do
				get :show, id: invoice
				expect(response).to render_template(:show)
			end

			it "assigns requested invoice to @invoice" do
				get :show, id: invoice
				expect(assigns(:invoice)).to eq(invoice)
			end
		end

		describe "GET new" do
			it "renders :new template" do
				get :new
				expect(response).to render_template(:new)
			end

			it "assigns new invoice to @invoice" do
				get :new
				expect(assigns(:invoice)).to be_a_new(Invoice)
			end
		end

		describe "POST create" do
			context "valid data" do
				let(:client)  {FactoryGirl.create(:client)}
				let (:valid_data) { FactoryGirl.attributes_for(:invoice, client_id: client.id) }

				it "redirects to invoices#show" do
					post :create, invoice: valid_data
					expect(response).to redirect_to(invoice_path(assigns[:invoice]))
				end

				it "creates new invoice in database" do
					expect{
						post :create, invoice: valid_data
					}.to change(Client, :count).by(1)
				end
			end
			context "invalid data" do
				let (:invalid_data) { FactoryGirl.attributes_for(:invoice, name: '') }
				let (:invalid_data2) { FactoryGirl.attributes_for(:invoice, street_address: '') }

				it "renders :new template" do
					post :create, invoice: invalid_data
					expect(response).to render_template(:new)
				end
				it "renders :new template#{2}" do
					post :create, invoice: invalid_data2
					expect(response).to render_template(:new)
				end
				it "does not creates new invoice in database" do
					expect{
						post :create, invoice: invalid_data
					}.not_to change(Client, :count)
				end
				it "does not creates new invoice in database#{2}" do
					expect{
						post :create, invoice: invalid_data2
					}.not_to change(Client, :count)
				end
			end
		end

		describe "PUT update" do
			let(:client)  {FactoryGirl.create(:client)}
			let(:invoice)  {FactoryGirl.create(:invoice, client_id: client.id)}

			context "valid data" do
				let (:valid_data) { FactoryGirl.attributes_for(:invoice, description: 'newDescription') }

				it "redirects to invoices#show" do
					put :update, id: invoice, invoice: valid_data
					expect(response).to redirect_to(invoice)
				end

				it "updates invoice in database" do
					put :update, id: invoice, invoice: valid_data
					invoice.reload
					expect(invoice.description).to eq('newDescription')
				end
			end
			context "invalid data" do
				let (:invalid_data) { FactoryGirl.attributes_for(:invoice, client_id: '') }

				it "renders :edit template" do
					put :update, id: invoice, invoice: invalid_data
					expect(response).to render_template(:edit)
				end
				it "does not creates new invoice in database" do
					put :update, id: invoice, invoice: invalid_data
					invoice.reload
					expect(invoice.description).not_to eq('testDescription')
				end
			end
		end

		describe "DELETE destroy" do
			let(:client)  {FactoryGirl.create(:client)}
			let(:invoice)  {FactoryGirl.create(:invoice, client_id: client.id)}

			it "redirects to invoices#index" do
				delete :destroy, id: invoice
				expect(response).to redirect_to(invoices_path)
			end

			it "deletes invoices from db" do
				delete :destroy, id: invoice
				expect(Invoice.exists?(invoice.id)).to be_falsy
			end
		end
	end
end