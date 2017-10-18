class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    if @group.new
      redirect_to :root, notice: 'グループ作成成功'
    else render :new
    end
  end

private
  def group_params
      params.require(:group).permit(:name)
  end
end
