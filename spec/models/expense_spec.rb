require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:each) do
    @user = User.new(name: 'christian', email: 'test@gmail.com', password: 'password',
                     password_confirmation: 'password')

    @user.save

    @group = Group.new(name: 'Group one')

    @group.save

    @expense = Expense.new(name: 'Expense one', amount: 100)

    @expense.save

    @group.expenses << @expense

    @user.groups << @group
  end

  it 'should have a name' do
    @expense.name
    expect(@expense.name).to eq('Expense one')
  end

  it 'should have an amount' do
    @expense.amount
    expect(@expense.amount).to eq(100)
  end

  it 'should belong to a group' do
    @expense.groups
    expect(@expense.groups).to eq(@expense.groups)
  end
end
