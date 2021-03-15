require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    it 'nicknameとemailとpasswordとpassword_confirmationとfirst_name,last_name,first_name_kana,last_name_kana,birtがあれば登録できる' do
      expect(@user).to be_valid
    end
    it 'nicknameが空では登録できない事' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない事' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailに＠がない場合は登録できない事' do
      @user.email = 'test.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'emailが重複している場合は登録できない事' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが空では登録できない事' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが全角では登録できない事' do
      @user.password = 'zenkaku１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には半角英字と数字の両方を含めて設定してください")
    end
    it 'passwordが数字だけでは登録できない事' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には半角英字と数字の両方を含めて設定してください')
    end
    it 'passwordが英だけでは登録できない事' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には半角英字と数字の両方を含めて設定してください')
    end
    it 'passwordが6文字以下では登録できない事' do
      @user.password = '123ab'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'last_nameが空では登録できない事' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'last_nameが漢字・平仮名・カタカナ以外では登録できない事' do
      @user.last_name = 'tanaka'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it 'first_nameが空では登録できない事' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_nameが漢字・平仮名・カタカナ以外では登録できない事' do
      @user.first_name = 'tadasi'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it 'last_name_kanaが空では登録できない事' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'last_name_kanaが全角カタカナ以外では登録できない事' do
      @user.last_name_kana = 'ﾀﾅｶ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    it 'first_name_kanaが空では登録できない事' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'first_name_kanaが全角カタカナ以外では登録できない事' do
      @user.first_name_kana = 'ﾀﾀﾞｼ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it 'birthが空では登録できない事' do
      @user.birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end
  end
end
