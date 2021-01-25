require 'rails_helper'

 RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user) #userインスタンス生成を@userのインスタンス変数へ代入
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録がうまく行くとき' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "nicknameが6文字以下で登録できる" do
        @user.nickname = "aaaaaa"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまく行かないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "nicknameが7文字以上であれば登録できない" do
        @user.nickname = "qqqqqqq"
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームは6文字以内で入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "aaaa"
        @user.password_confirmation = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
  end

 end