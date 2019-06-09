class LettersController < ApplicationController
  def index
    @letter = Letter.all
  end

  def new
    if params[:back]
      @letter = Letter.new(letter_params)
    else
      @letter = Letter.new
    end
  end

  def create
    @letter = Letter.new(letter_params)
    if @letter.save
     redirect_to action: 'index'
    else
     render 'new'
    end
  end

  private

  def letter_params
        params.require(:letter).permit(:content)
  end
end
