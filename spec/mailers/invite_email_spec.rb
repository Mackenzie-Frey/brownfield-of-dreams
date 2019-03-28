require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'invite_email' do
    before(:each) do
      current_user = create(:user)
      invite_data = { :name=>"Mackenzie Frey",  :email => 'test@brownfield.com' }

      @invite = Invite.new(current_user, invite_data)
      @mail = UserMailer.invite_email(@invite).deliver_now
    end

    it 'renders the subject' do
      expect(@mail.subject).to eq('Brownfield Invitation')
    end

    it 'renders the receiver email' do
      expect(@mail.to).to eq([@invite.email])
    end

    it 'renders the sender email' do
      expect(@mail.from).to eq(['no-reply@brownfield.com'])
    end

    it 'assigns name' do
      expect(@mail.body.encoded).to match(@invite.name)
    end

    it 'assigns inviter_name' do
      expect(@mail.body.encoded).to match(@invite.inviter_name)
    end
  end
end
