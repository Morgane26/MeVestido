class ProposalsController < ApplicationController

  def index
    @proposals = Proposal.all

  end

  def new
    @proposal = Proposal.new
    @usage_list = Proposal.usages
    @meteo = Proposal.meteos
  end

  def create
    @proposal = Proposal.new(proposal_params)
    if @proposal.save
      redirect_to new_proposal_path, notice: "Proposal created"
    else
      render :new
    end
  end

  def plan
    @proposal = Proposal.new
  end

  def results
    # appel à l'api de météo pour récupérer la température en integer
    get_temperature = "appel à l'api de météo"
    # mapping de température avec la saison
    binding.pry
    season = temp_to_season(20)
    #recherche des propositions correspondantes à la saison et l'usage
    #@proposals = Proposal.all.where(meteo: season, usage: params[:proposal][:usage])
    @proposals = Proposal.all.where(meteo: params[:proposal][:meteo], usage: params[:proposal][:usage])
  end

private

  def temp_to_season(t)
    if t > 25
      "summer"
    elsif t > 15
      "spring"
    elsif t > 10
      "autumn"
    else
      "winter"
    end
  end

  def proposal_params
    params.require(:proposal).permit(:usage_id, :meteo)
  end

end