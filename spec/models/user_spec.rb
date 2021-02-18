require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
    end
    it 'nicknameが6文字以下であれば登録できる' do
    end
    it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
    end
    it 'nicknameが空では登録できない' do
    end
    it 'emailが空では登録できない' do
    end
    it 'passwordが空では登録できない' do
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
    end
    it 'nicknameが7文字以上では登録できない' do
    end
    it '重複したemailが存在する場合登録できない' do
    end
    it 'passwordが5文字以下では登録できない' do
    end
  end

  describe '新規登録/本人情報確認' do
    it 'ユーザー本名は、名字と名前がそれぞれ必須であること' do
    end
    it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
    end
    it 'ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること' do
    end
    it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
    end
    it '生年月日が必須であること' do
    end
  end
end


