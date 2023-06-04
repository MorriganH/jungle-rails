require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'password and password_confirmation fields' do
    it 'should not create user if fields are different' do
      @user = User.new :name => "Tom", :email => 'tom@tom.com', :password => 'password', :password_confirmation => ''
      @user.save
      @check_user ||= User.find_by email: "tom@tom.com"
      expect(@check_user).to be_nil
    end

    it 'should create user if fields match' do
      @user = User.new :name => "Tom", :email => 'tom@tom.com', :password => 'password', :password_confirmation => 'password' 
      @user.save
      @check_user ||= User.find_by email: "tom@tom.com"
      expect(@check_user).not_to be_nil
    end
  end

  describe 'email' do
    it 'must be unique (case insensitive)' do
      @first_user = User.new :name => 'Tom', :email => 'tom@tom.com', :password => 'password', :password_confirmation => 'password'
      @first_user.save
      @second_user = User.new :name => 'Tommy', :email => 'Tom@tom.com', :password => '12345', :password_confirmation => '123'
      
      # expect(@second_user.save).to raise_error
    end
  end

  describe 'password' do
    it 'should save when greater than 4 characters' do
      @user = User.new :name => 'Tom', :email => 'tom@tom.com', :password => 'password', :password_confirmation => 'password'
      @user.save
      @check_user ||= User.find_by email: 'tom@tom.com'
      expect(@check_user).not_to be_nil
    end

    it 'should not save when 4 characters or less' do
      @user = User.new :name => 'Tom', :email => 'tom@tom.com', :password => '1234', :password_confirmation => '1234'
      @user.save
      @check_user ||= User.find_by email: 'tom@tom.com'
      expect(@check_user).to be_nil
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should return a user if credentials are verified' do
      @user = User.new :name => 'Tom', :email => 'tom@tom.com', :password => '12345', :password_confirmation => '12345'
      @user.save
      expect(User.authenticate_with_credentials('tom@tom.com', '12345')).not_to be_nil
    end
    it 'should return nil if credentials are invalid' do
      @user = User.new :name => 'Tom', :email => 'tom@tom.com', :password => '12345', :password_confirmation => '12345'
      @user.save
      expect(User.authenticate_with_credentials('tom@tom.com', 'abcde')).to be_nil
    end
  end
end
