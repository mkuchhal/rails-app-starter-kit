require 'rails_helper'

describe PostPolicy do
  subject { PostPolicy.new(user, post) }

  context 'for a guest user' do
    let(:user) { nil }
    let(:post) { FactoryGirl.create(:post) }

    it { should permit(:index) }
    it { should permit(:show) }
    it { should_not permit(:create) }
    it { should_not permit(:new) }
    it { should_not permit(:update) }
    it { should_not permit(:edit) }
    it { should_not permit(:destroy) }
  end

  context 'for a signed in user' do
    let(:user) { FactoryGirl.create(:user) }
    let(:post) { FactoryGirl.create(:post) }

    it { should permit(:index) }
    it { should permit(:show) }
    it { should permit(:create) }
    it { should permit(:new) }

    context 'for a post created by someone else' do
      it { should_not permit(:update) }
      it { should_not permit(:edit) }
      it { should_not permit(:destroy) }
    end

    context 'for a post created by the user' do
      # Create a post belonging to the signed-in user
      let(:post) { FactoryGirl.create(:post, user: user) }

      it { should permit(:update) }
      it { should permit(:edit) }
      it { should permit(:destroy) }
    end
  end
end
