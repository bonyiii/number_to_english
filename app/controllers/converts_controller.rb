class ConvertsController < ApplicationController
  # GET /converts
  # GET /converts.json
  def index
    @converts = Convert.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @converts }
    end
  end

  # GET /converts/1
  # GET /converts/1.json
  def show
    @convert = Convert.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @convert }
    end
  end

  # GET /converts/new
  # GET /converts/new.json
  def new
    @convert = Convert.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @convert }
    end
  end

  # GET /converts/1/edit
  def edit
    @convert = Convert.find(params[:id])
  end

  # POST /converts
  # POST /converts.json
  def create
    @convert = Convert.new(params[:convert])
    @convert.word = @convert.to_english(@convert.arabic)

    respond_to do |format|
      if @convert.save
        format.html { redirect_to @convert, notice: 'Convert was successfully created.' }
        format.json { render json: @convert, status: :created, location: @convert }
      else
        format.html { render action: "new" }
        format.json { render json: @convert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /converts/1
  # PUT /converts/1.json
  def update
    @convert = Convert.find(params[:id])

    respond_to do |format|
      if @convert.update_attributes(params[:convert])
        format.html { redirect_to @convert, notice: 'Convert was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @convert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /converts/1
  # DELETE /converts/1.json
  def destroy
    @convert = Convert.find(params[:id])
    @convert.destroy

    respond_to do |format|
      format.html { redirect_to converts_url }
      format.json { head :no_content }
    end
  end
end
