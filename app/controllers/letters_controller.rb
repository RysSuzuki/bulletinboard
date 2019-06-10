class LettersController < ApplicationController
 before_action :set_letter, only: [:show, :edit, :update, :destroy] # destroyアクションを追加

  def index
    @letter = Letter.all
  end

  def show
  end

  def edit
  end

  def update
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

  def destroy
    @letter.destroy
    redirect_to letters_path, notice:"投稿を削除しました！"
  end

  def confirm
    @letter = Letter.new(letter_params)
  end

  private

  def letter_params
        params.require(:letter).permit(:content)
  end

  def set_letter
    @letter = Letter.find(params[:id])
  end

end
