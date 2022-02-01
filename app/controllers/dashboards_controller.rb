# frozen_string_literal: true

class DashboardsController < ApplicationController
  def show
    @text_shout = TextShout.new
    @text_shouts = TextShout.all
  end
end
