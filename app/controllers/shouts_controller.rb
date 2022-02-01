# frozen_string_literal: true

class ShoutsController < ApplicationController
  def create
    @shouts = Shout.all

    @shout = current_user.shouts.build(text_shout_params)

    if @shout.save
      redirect_to root_path, notice: "Shout successfully created!"
    else
      render "dashboards/show", status: :unprocessable_entity
    end
  end

  private

  def text_shout_params
    { shoutable: shoutable_from_params }
  end

  def shoutable_from_params
    TextShout.new(shoutable_params)
  end

  def shoutable_params
    params.require(:shout).require(:shoutable).permit(:body)
  end
end
