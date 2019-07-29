require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前とメールアドレスとパスワードがあれば登録できる" do
    expect(FactoryBot.create(:user)).to be_valid
  end

  it "名前がなければ登録できない" do
    expect(FactoryBot.build(:user, nickname: " ")).to_not be_valid
  end

  it "メールアドレスがなければ登録できない" do
    expect(FactoryBot.build(:user, email: " ")).to_not be_valid
  end

  it "メールアドレスが重複していたら登録できない" do 
    user1 = FactoryBot.create(:user, nickname: "taro", email: "taro@example.com")
    expect(FactoryBot.build(:user, nickname: "ziro", email: user1.email)).to_not be_valid
  end

  it "パスワードがなければ登録できない" do
    expect(FactoryBot.build(:user, password: " ")).to_not be_valid
  end

  it "パスワードが暗号化されているか" do
    user = FactoryBot.create(:user)
    expect(user.encrypted_password).to_not eq "password"
  end

  it "password_confirmationとpasswordが異なる場合保存できない" do 
    expect(FactoryBot.build(:user, password: "password", password_confirmation: "passward")).to_not be_valid 
  end

  it "nicknameに”メルカリ”が入ると登録できない" do
    expect(FactoryBot.build(:user, nickname: "メルカリ")).to_not be_valid
  end

  it "パスワードが6文字以上なら登録できる" do
    expect(FactoryBot.build(:user, password: "hoge00", password_confirmation: "hoge00")).to be_valid
  end

  it "パスワードが5文字以下だと登録できない" do
    expect(FactoryBot.build(:user, password: "hoge0", password_confirmation: "hoge0")).to_not be_valid
  end

  it "数字だけのパスワードだと登録できない" do
    expect(FactoryBot.build(:user, password: "00000000", password_confirmation: "00000000")).to_not be_valid
  end
end