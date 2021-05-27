require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end
    describe 'ユーザー新規登録' do
      context '新規登録できるとき' do
        it 'first_name、last_name、name_reading、surname_reading、nickname、email、password、password_confirmation、birthdayが存在すれば登録できること' do
          expect(@user).to be_valid
        end

        it 'passwordが6文字以上で半角英数字混合であれば登録できること' do
          @user.password = 'a12345'
          @user.password_confirmation = 'a12345'
          expect(@user).to be_valid
        end
      end

      context '新規登録できないとき' do
        it 'first_nameが空では登録できないこと' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it 'first_nameが全角入力でなければ登録できないこと' do
          @user.first_name = 'ｱｲｳｴｵ'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end

        it 'last_nameが空では登録できないこと' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end

        it 'last_nameが全角入力でなければ登録できないこと' do
          @user.last_name = 'ｱｲｳｴｵ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid")
        end

        it 'name_readingが空では登録できないこと' do
          @user.name_reading = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Name reading can't be blank")
        end

        it 'name_readingが全角カタカナ出ないと登録できないこと' do
          @user.name_reading = 'やまもと'
          @user.valid?
          expect(@user.errors.full_messages).to include("Name reading is invalid")
        end

        it 'surname_readingが空では登録できないこと' do
          @user.surname_reading = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Surname reading can't be blank")
        end
  
        it 'surname_readingが全角カタカナ出ないと登録できないこと' do
          @user.surname_reading = 'やまもと'
          @user.valid?
          expect(@user.errors.full_messages).to include("Surname reading is invalid")
        end

        it 'nicknameが空では登録できないこと' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'emailが空では登録できないこと' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it 'passwordが空では登録できないこと' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'birthdayが空では登録できないこと' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end 

        it 'passwordが5文字以下だと登録できないこと' do
          @user.password = 'a1234'
          @user.password_confirmation = 'a1234'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end

        it 'passwordとpassword_confirmationが不一致では登録できないこと' do
          @user.password = 'a12345'
          @user.password_confirmation = 'a123456'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end 

        it 'passwordが半角英数字混合でないと登録できないこと' do
          @user.password = '111111'
          @user.password_confirmation = '111111'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end

        it '重複したemailが存在する場合登録できないこと' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end  
      end
   end
end
