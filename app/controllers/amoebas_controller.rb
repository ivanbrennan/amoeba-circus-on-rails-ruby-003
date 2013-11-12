class AmoebasController < ApplicationController
  def index
    @amoebas = Amoeba.all
  end

  def show
    @amoeba = Amoeba.find(params[:id])
  end

  def split
    @parent = Amoeba.find(params[:id])
    @talent = @parent.talent
    @generation = @parent.generation + 1
    2.times.collect { Amoeba.create(:name=>Amoeba.random_name, :talent=>@talent, :generation=>@generation) }
    @parent.destroy
    redirect_to amoebas_path
  end

  def edit
    @amoeba = Amoeba.find(params[:id])
    @acts = Act.all
  end

  def update
    @amoeba = Amoeba.find(params[:id])
    acts = params[:amoeba][:acts].collect { |id| Act.find(id) }
    @amoeba.update(:name => params[:amoeba][:name])
    @amoeba.update(:acts => acts)
    redirect_to amoeba_path(@amoeba)
  end
end
