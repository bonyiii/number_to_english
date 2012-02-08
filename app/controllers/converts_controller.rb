class ConvertsController < ApplicationController

  # GET /converts/new
  # GET /converts/new.json
  def new
    @convert = Convert.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @convert }
    end
  end

  # POST /converts
  # POST /converts.json
  def create
    @convert = Convert.new(params[:convert])
    
    respond_to do |format|
      if @convert.valid?
        @convert.number = @convert.number.to_i
        format.html { render action: "new", notice: 'Convert was successfully created.' }
        format.json { render json: @convert, status: :created, location: @convert }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @convert.errors, status: :unprocessable_entity }
      end
    end
  end

end
