class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

<<<<<<< HEAD
	def create
		@group = Group.new(group_params)
		if @group.save
		   redirect_to :root, notice: 'グループ作成成功'
		else render :new
		end
	end

	private
	def group_params
		params.require(:group).permit(:name, user_ids: [])
	end
=======
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
>>>>>>> origin/Create-New-group-chat
end
