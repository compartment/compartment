require 'spec_helper'
require 'compartment/setup_wizard'

describe Compartment::SetupWizard do

  describe '#initialize' do
    it 'takes a site and user' do
      site = Compartment::Site.new
      user = Compartment::User.new
      wizard = Compartment::SetupWizard.new(site, user)
    end
  end

  describe '#save' do
    subject { Compartment::SetupWizard.new(site, user) }

    context 'when site is invalid' do
      let(:site){ double(:site, valid?: false) }
      let(:user){ double(:user, valid?: false) }
      it 'returns false' do
        subject.save.should be false
      end
    end

    context 'when user is invalid' do
      let(:site){ double(:site, valid?: true) }
      let(:user){ double(:user, valid?: false) }
      it 'returns false' do
        subject.save.should be false
      end
    end

    context 'when both site and user are valid' do
      context 'when site fails to save' do
        let(:site){ double(:site, valid?: true, save: false) }
        let(:user){ double(:user, valid?: true, save: false) }
        it 'returns false' do
          subject.save.should be false
        end
      end

      context 'when user fails to save' do
        let(:site){ double(:site, valid?: true, save: true) }
        let(:user){ double(:user, valid?: true, save: false) }
        it 'returns false' do
          subject.save.should be false
        end
      end

      context 'when site and user save successfully' do
        let(:site){ double(:site, valid?: true, save: true) }
        let(:user){ double(:user, valid?: true, save: true) }
        it 'returns true' do
          subject.save.should be true
        end
      end
    end
  end

end
