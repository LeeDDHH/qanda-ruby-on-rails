class AnswersController < ApplicationController
  # 回答の登録
  def create
    # question_idパラメータを指定して質問データを取得する
    @question = Question.find(params[:question_id])
    # 質問データに　紐づく回答のデータを生成する
    @question.answers.create(answer_params)
    # 質問詳細画面にリダイレクトする
    redirect_to question_path(@question)
  end

  # 回答の削除
  def destroy
  end

  private

  def answer_params
    params.require(:answer).permit(:name, :content)
  end
end
