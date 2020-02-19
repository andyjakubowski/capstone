class TokensController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @token = @list.tokens.create(token_params)
    redirect_to list_path(@list)
  end

  private

    def token_params
      params.require(:token).permit(:name, :value)
    end
end