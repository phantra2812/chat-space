class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to :root, notice: 'グループ作成成功'
    else render :new
    end
  end

  def edit
    @group = find_group
  end

  def update
    @group = find_group
    if @group.update(group_params)
      redirect_to :root, notice: 'グループ更新成功'
    else render :edit
    end
  end

private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def find_group
    Group.find(params[:id])
  end
end
