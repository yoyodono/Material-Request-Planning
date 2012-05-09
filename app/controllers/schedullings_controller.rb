class SchedullingsController < ApplicationController
  # GET /schedullings
  # GET /schedullings.xml
  def index
    @schedullings = Schedulling.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @schedullings }
    end
  end

  # GET /schedullings/1
  # GET /schedullings/1.xml
  def show
    @schedulling = Schedulling.find(params[:id])
	@periode = @schedulling.periode
	
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @schedulling }
    end
  end

  # GET /schedullings/new
  # GET /schedullings/new.xml
  def new
    @schedulling = Schedulling.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @schedulling }
    end
  end

  # GET /schedullings/1/edit
  def edit
    @schedulling = Schedulling.find(params[:id])
    @periode = @schedulling.periode    
    
    
  end

  # POST /schedullings
  # POST /schedullings.xml
  def create
    @schedulling = Schedulling.new(params[:schedulling])
	@periode = @schedulling.periode
    respond_to do |format|
      if @schedulling.save
        format.html { redirect_to(@schedulling, :notice => 'Schedulling was successfully created.') }
        format.xml  { render :xml => @schedulling, :status => :created, :location => @schedulling }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @schedulling.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /schedullings/1
  # PUT /schedullings/1.xml
  def update
  	params[:schedulling][:i] ||= {}
    @schedulling = Schedulling.find(params[:id])

    respond_to do |format|
      if @schedulling.update_attributes(params[:schedulling])
        format.html { redirect_to(@schedulling, :notice => 'Schedulling was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @schedulling.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /schedullings/1
  # DELETE /schedullings/1.xml
  def destroy
    @schedulling = Schedulling.find(params[:id])
    @schedulling.destroy

    respond_to do |format|
      format.html { redirect_to(schedullings_url) }
      format.xml  { head :ok }
    end
  end
end
