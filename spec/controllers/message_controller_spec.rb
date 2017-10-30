require 'rails_helper'

describe MessagesController, type: :controller do
  let (:user)            { create(:user) }
  let (:group)           { create(:group) }
  let (:message)         { build(:message) }

    context 'when user logged in' do
      before do
      login_user user
      get :index, params: { group_id: group }
    end

    describe 'GET #index' do

      it "assigns the requested group to @group" do
        expect(assigns(:group)).to eq (group)
      end

      it "assigns the requested message to @message" do
        expect(assigns(:message)).to be_a_new Message
      end

      it "renders the: index template" do
        expect(assigns(:group)).to render_template :index
      end
    end

    describe 'POST #create' do
      context 'when user logged in and saved successfully' do

      it "@message was saved successfully" do
        expect {
        post :create, params: { group_id: group, message: attributes_for(:message) }}.to change(Message, :count).by(1)
      end

      it "redirects to: index template" do
        post :create, params: { group_id: group, message: attributes_for(:message) }
        expect(response).to redirect_to group_messages_path
      end
    end

      context 'when user logged in and saved unsuccessfully' do

      it "@message was not save successfully" do
        expect {
        post :create, params: { group_id: group, message: attributes_for(:message, text: nil, image: nil) }}.to change(Message, :count)
      end

      it "redirect_to: index template" do
        post :create, params: { group_id: group, message: attributes_for(:message) }
        expect(response).to redirect_to group_messages_path
      end
    end
  end
end

    context "when user does not login" do

      it "redirects to: new_user_session_path" do
      get :index, params: {group_id: group}
      expect(response).to redirect_to new_user_session_path
    end
  end

end

