class ActsController < ApplicationController
  def index
    @acts = Act.all
  end

  def show
    @act = Act.find(params[:id])
  end

  def edit
    @act = Act.find(params[:id])
    @amoebas = Amoeba.all
  end

  def update
    @act = Act.find(params[:id])
    amoebas = params[:act][:amoebas].collect { |id| Amoeba.find(id) }
    @act.update(:name => params[:act][:name], :date => params[:act][:date], :time => params[:act][:time])
    @act.update(:amoebas => amoebas)
    redirect_to act_path(@act)
  end
end
