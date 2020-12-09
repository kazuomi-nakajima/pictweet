require 'rails_helper'

 RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user) #userインスタンス生成を@userのインスタンス変数へ代入
  end

   describe 'ユーザー新規登録' do
     it "nicknameが空だと登録できない" do
      @user.nickname = "" #nicknameの値に空を代入
      @user.valid? #保存されるものなのかどうかを確認
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
     it "emailが空では登録できない" do
      @user.email = "" #emailの値に空を代入
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end
   end
 end