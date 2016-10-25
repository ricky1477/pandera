require 'rails_helper'

describe ShippingAddressesController do

	describe "guest admin" do
		describe "GET index" do
			it "renders :index template" do
				get :index
				expect(response).to render_template(:index)
			end
		end

		describe "GET show" do
			let(:shipping_address)  {FactoryGirl.create(:shipping_address)}

			it "renders :show template" do
				get :show, id: shipping_address
				expect(response).to render_template(:show)
			end

			it "assigns requested shipping_address to @shipping_address" do
				get :show, id: shipping_address
				expect(assigns(:shipping_address)).to eq(shipping_address)
			end
		end

		describe "GET edit" do
			let(:shipping_address)  {FactoryGirl.create(:shipping_address)}

			it "renders :edit template" do
				get :edit, id: shipping_address
				# Take locale param off of new_admin_session_path
				expect(response).to redirect_to( new_admin_session_path.slice(0..(new_admin_session_path.index('?')-1)) )
			end

			it "assigns the requested shipping_address to template" do
				get :edit, id: shipping_address
				expect(assigns(:shipping_address)).to eq(shipping_address)
			end
		end

		describe "GET new" do
			it "redirects to login page" do
				get :new
				expect(response).to redirect_to( new_admin_session_path.slice(0..(new_admin_session_path.index('?')-1)) )
			end
		end

		describe "POST create" do
			it "redirects to login page" do
				post :create, shipping_address: FactoryGirl.attributes_for(:shipping_address)
				expect(response).to redirect_to( new_admin_session_path.slice(0..(new_admin_session_path.index('?')-1)) )
			end
		end

		describe "GET edit" do
			it "redirects to login page" do
				get :edit, id: FactoryGirl.create(:shipping_address)
				expect(response).to redirect_to( new_admin_session_path.slice(0..(new_admin_session_path.index('?')-1)) )
			end
		end

		describe "PUT update" do
			it "redirects to login page" do
				put :update, id: FactoryGirl.create(:shipping_address), shipping_address: FactoryGirl.attributes_for(:shipping_address)
				expect(response).to redirect_to( new_admin_session_path.slice(0..(new_admin_session_path.index('?')-1)) )
			end
		end

		describe "DELETE destroy" do
			it "redirects to login page" do
				delete :destroy, id: FactoryGirl.create(:shipping_address)
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
			let(:shipping_address)  {FactoryGirl.create(:shipping_address)}

			it "renders :show template" do
				get :show, id: shipping_address
				expect(response).to render_template(:show)
			end

			it "assigns requested shipping_address to @shipping_address" do
				get :show, id: shipping_address
				expect(assigns(:shipping_address)).to eq(shipping_address)
			end
		end

		describe "GET new" do
			it "renders :new template" do
				get :new
				expect(response).to render_template(:new)
			end

			it "assigns new shipping_address to @shipping_address" do
				get :new
				expect(assigns(:shipping_address)).to be_a_new(ShippingAddress)
			end
		end

		describe "POST create" do
			context "valid data" do
				let (:valid_data) { FactoryGirl.attributes_for(:shipping_address) }

				it "redirects to shipping_addresss#show" do
					post :create, shipping_address: valid_data
					expect(response).to redirect_to(shipping_address_path(assigns[:shipping_address]))
				end

				it "creates new shipping_address in database" do
					expect{
						post :create, shipping_address: valid_data
					}.to change(ShippingAddress, :count).by(1)
				end
			end
		end

		describe "PUT update" do
			let(:shipping_address)  {FactoryGirl.create(:shipping_address)}

			context "valid data" do
				let (:valid_data) { FactoryGirl.attributes_for(:shipping_address, street: 'newStreet') }

				it "redirects to shipping_addresss#show" do
					put :update, id: shipping_address, shipping_address: valid_data
					expect(response).to redirect_to(shipping_address)
				end

				it "updates shipping_address in database" do
					put :update, id: shipping_address, shipping_address: valid_data
					shipping_address.reload
					expect(shipping_address.street).to eq('newStreet')
				end
			end
		end

		describe "DELETE destroy" do
			let(:shipping_address)  {FactoryGirl.create(:shipping_address)}

			it "redirects to shipping_address#index" do
				delete :destroy, id: shipping_address
				expect(response).to redirect_to(shipping_addresses_path)
			end

			it "deletes shipping_addresss from db" do
				delete :destroy, id: shipping_address
				expect(ShippingAddress.exists?(shipping_address.id)).to be_falsy
			end
		end
	end
end