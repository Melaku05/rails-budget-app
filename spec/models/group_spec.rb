require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user = User.new(name: 'christian', email: 'test@gmail.com', password: 'password',
                     password_confirmation: 'password')

    @user.save

    @group = Group.new(name: 'Group one')

    @group.save

    @expense = Expense.new(name: 'Expense one', amount: 100)

    @expense.save

    @group.expenses << @expense
  end

  it 'should have a name' do
    @group.name
    expect(@group.name).to eq('Group one')
  end

  it 'should have expenses' do
    @group.expenses
    expect(@group.expenses).to eq([@expense])
  end
end
