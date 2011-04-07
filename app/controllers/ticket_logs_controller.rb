class TicketLogsController < ApplicationController
  # GET /ticket_logs
  # GET /ticket_logs.xml
  def index
    @ticket_logs = TicketLog.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ticket_logs }
    end
  end

  # GET /ticket_logs/1
  # GET /ticket_logs/1.xml
  def show
    @ticket_log = TicketLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ticket_log }
    end
  end

  # GET /ticket_logs/new
  # GET /ticket_logs/new.xml
  def new
    @ticket_log = TicketLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ticket_log }
    end
  end

  # GET /ticket_logs/1/edit
  def edit
    @ticket_log = TicketLog.find(params[:id])
  end

  # POST /ticket_logs
  # POST /ticket_logs.xml
  def create
    @ticket_log = TicketLog.new(params[:ticket_log])

    respond_to do |format|
      if @ticket_log.save
        format.html { redirect_to(@ticket_log, :notice => 'Ticket log was successfully created.') }
        format.xml  { render :xml => @ticket_log, :status => :created, :location => @ticket_log }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ticket_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ticket_logs/1
  # PUT /ticket_logs/1.xml
  def update
    @ticket_log = TicketLog.find(params[:id])

    respond_to do |format|
      if @ticket_log.update_attributes(params[:ticket_log])
        format.html { redirect_to(@ticket_log, :notice => 'Ticket log was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ticket_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ticket_logs/1
  # DELETE /ticket_logs/1.xml
  def destroy
    @ticket_log = TicketLog.find(params[:id])
    @ticket_log.destroy

    respond_to do |format|
      format.html { redirect_to(ticket_logs_url) }
      format.xml  { head :ok }
    end
  end
end
