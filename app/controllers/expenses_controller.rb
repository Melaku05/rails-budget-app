class ExpensesController < ApplicationController
  load_and_authorize_resource

  def index
    redirect_to groups_url
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.author = current_user

    respond_to do |format|
      if @expense.save
        format.html { redirect_to @expense.groups.first, notice: 'Expense was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    flash[:success] = 'Expense was successfully deleted.'
    redirect_to root_path
  end

  def expense_params
    params.require(:expense).permit(:name, :amount, group_ids: [])
  end
end
