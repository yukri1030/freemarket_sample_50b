require 'rails_helper'

RSpec.describe SnsCredential, type: :model do
  it "nickname, email, passwordがあれば登録できる" do
      expect(FactoryBot.create(:sns_credential)).to be_valid
  end

  it "名前がなければ登録できない" do
    expect(FactoryBot.build(:sns_credential, email: " ")).to_not be_valid
  end

  it "uidがなければ登録できない" do
    expect(FactoryBot.build(:sns_credential, uid: " ")).to_not be_valid
  end

  it "providerなしでは登録できない" do
    expect(FactoryBot.build(:sns_credential, provider: " ")).to_not be_valid
  end
end
