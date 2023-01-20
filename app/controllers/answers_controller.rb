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
    # question_idパラメータを指定して質問データを取得する
    @question = Question.find(params[:question_id])
    # idパラメータを指定して、質問データと紐づく回答データを取得する
    @answer = @question.answers.find(params[:id])
    # 回答を削除する
    @answer.destroy
    # statusに :see_otherを指定することでステータスコード303が使われる
    # 新規リソースへの移動
    # フォーム操作後に何かしらのURLに転送したい時に使われる
    # see_otherをつけないと意図しない挙動にかる可能性がある
    redirect_to @question, status: :see_other
  end

  private

  def answer_params
    params.require(:answer).permit(:name, :content)
  end
end
