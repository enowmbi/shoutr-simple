class ShoutsController < ApplicationController
  def create
    @text_shouts = TextShout.all
    @text_shout = current_user.text_shouts.build(text_shout_params)

    if @text_shout.save
      redirect_to root_path, notice: "Text shout successfully created!"
    else
      render "dashboards/show", status: :unprocessable_entity
    end
  end

  private

  def text_shout_params
    params.require(:text_shout).permit(:body)
  end
end
