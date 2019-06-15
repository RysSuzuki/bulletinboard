class LettersController < ApplicationController
 before_action :set_letter, only: [:edit,:show, :update, :destroy]

  def index
    @letter = Letter.all
  end

  def edit
  end

  def show
  end

  def update
    if @letter.update(letter_params)
      redirect_to letters_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
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
    if @letter.invalid?
      if params[:new]
        render 'new'
      else
        render 'edit'
      end
   end
  end

  private

  def letter_params
    params.require(:letter).permit(:content)
  end

  def set_letter
    @letter = Letter.find(params[:id])
  end

end
