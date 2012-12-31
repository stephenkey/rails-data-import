class DataController < ApplicationController

  def index
    @data = Datum.all

    respond_to do |format|
      format.html 
    end
  end

  def new
    # Open file using a helper method on the Datum model and
    # pass the spreadsheet to the view to loop through the contents and
    # put the contents in a form for the user to proof/edit before saving.
    @spreadsheet = Datum.open_spreadsheet(params[:file])
    
    respond_to do |format|
      format.html 
    end
  end

  def edit
    @datum = Datum.find(params[:id])
  end

  def create
    # Loop through the data param and save each datum as a record.
    imported = []
    params[:data].each do |k, v|
      @datum = Datum.new(v)
      if @datum.save
        imported.push(k)
      end
    end

    respond_to do |format|
      format.html { redirect_to root_url, notice: "#{imported.size} records were created." }
    end
  end

  def update
    # Update an individual datum.
    @datum = Datum.find(params[:id])

    respond_to do |format|
      if @datum.update_attributes(params[:datum])
        format.html { redirect_to @datum, notice: 'Datum was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    # Delete an individual datum.
    @datum = Datum.find(params[:id])
    @datum.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
    end
  end
end
