class SendeventsController < ApplicationController
  # GET /sendevents
  # GET /sendevents.json
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sendevents }
    end
  end

 

  # GET /sendevents/new
  # GET /sendevents/new.json
  def new
    @sendevent = Sendevent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sendevent }
    end
  end

  # GET /sendevents/1/edit
  def edit
    @sendevent = Sendevent.find(params[:id])
  end

  # POST /sendevents
  # POST /sendevents.json
  def create
    @sendevent = Sendevent.new(params[:sendevent])
    redirect_to root_path
    respond_to do |format|
    end
  end

  # PUT /sendevents/1
  # PUT /sendevents/1.json
  def update
    @sendevent = Sendevent.find(params[:id])

    respond_to do |format|
      if @sendevent.update_attributes(params[:sendevent])
        format.html { redirect_to @sendevent, notice: 'Sendevent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sendevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sendevents/1
  # DELETE /sendevents/1.json
  def destroy
    @sendevent = Sendevent.find(params[:id])
    @sendevent.destroy

    respond_to do |format|
      format.html { redirect_to sendevents_url }
      format.json { head :no_content }
    end
  end
end
