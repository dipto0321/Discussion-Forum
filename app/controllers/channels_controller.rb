# frozen_string_literal: true

class ChannelsController < ApplicationController
  before_action :set_channel, only: %i[show edit update destroy]

  # GET /channels
  # GET /channels.json
  def index
    @channels = Channel.all
    @discussions = Discussion.all.order('created_at desc')
  end

  # GET /channels/1
  # GET /channels/1.json
  def show
    @discussions = Discussion.all.where('channel_id = ?', @channel_id)
    @channels = Channel.all
  end

  # GET /channels/new
  def new
    @channel = Channel.new
  end

  # GET /channels/1/edit
  def edit; end

  # POST /channels
  # POST /channels.json
  def create
    @channel = Channel.new(channel_params)

    respond_to do |format|
      if @channel.save
        format.html { redirect_to channels_path, notice: 'Channel was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /channels/1
  # PATCH/PUT /channels/1.json
  def update
    respond_to do |format|
      if @channel.update(channel_params)
        format.html { redirect_to channels_path, notice: 'Channel was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /channels/1
  # DELETE /channels/1.json
  def destroy
    @channel.destroy
    respond_to do |format|
      format.html { redirect_to channels_url, notice: 'Channel was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_channel
    @channel = Channel.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def channel_params
    params.require(:channel).permit(:name, :description)
  end
end
