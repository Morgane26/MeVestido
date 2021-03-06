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
    @usage = params["usage"]
    # appel à l'api de météo pour récupérer la température en integer
    weather_instance = Weather.new(current_user.city)
        # weather_instance.save!
    @meteo = weather_instance.call
    # mapping de température avec la saison
    # @season = temp_to_meteo(@meteo.temperature)
    @season = temp_to_meteo(21.2)
    #recherche des propositions correspondantes à la saison et l'usage
    #@proposals = Proposal.all.where(meteo: season, usage: params[:proposal][:usage])
    @proposals = Proposal.all.where(meteo: @season, usage: params["usage"])

  end

private

  def temp_to_meteo(t)
    if t > 17
      "summer"
    elsif t > 12
      "spring"
    elsif t > 8
      "autumn"
    else
      "winter"
    end
  end

  def proposal_params
    params.require(:proposal).permit(:usage_id, :meteo)

    # if user_choice == :chill
    #   return proposal_chill
    #   if user_choice == :work
    #     return proposal_work
    #     if user_choice == :night
    #       if user_choice == :sport
    #       end
    #     end
    #   end
    # end


  end

end
