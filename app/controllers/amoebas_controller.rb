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
    2.times.collect { Amoeba.create(:name=>random_name, :talent=>@talent, :generation=>@generation) }
    @parent.destroy
    redirect_to amoebas_path
  end

  def edit
    @amoeba = Amoeba.find(params[:id])
  end

  def update
    @amoeba = Amoeba.find(params[:id])
    @amoeba.update(params.require(:amoeba).permit(:name, :acts => []))
    redirect_to amoeba_path(@amoeba)
  end

  def random_name
    names = %w(Reggie Peggie Egg-head Peg-leg Art Bart Stan Dan Pam)
    "#{names.sample}-#{names.sample}"
  end
end
