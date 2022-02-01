# frozen_string_literal: true

class ShoutsController < ApplicationController
  def create
    @shouts = Shout.all

    @shout = current_user.shouts.build(shout_content_params)

    if @shout.save
      redirect_to root_path, notice: "Shout successfully created!"
    else
      render "dashboards/show", status: :unprocessable_entity
    end
  end

  private

  def shout_content_params
    { shoutable: shoutable_from_params }
  end

  def shoutable_from_params
    case params[:shout][:shoutable_type]
    when "TextShout" then TextShout.new(text_shout_content_params)
    when "PhotoShout" then PhotoShout.new(photo_shout_content_params)
    end
  end

  def text_shout_content_params
    params.require(:shout).require(:shoutable).permit(:body)
  end

  def photo_shout_content_params
    params.require(:shout).require(:shoutable).permit(:image)
  end
end
