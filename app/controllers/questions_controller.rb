class QuestionsController < ApplicationController
  # 質問一覧表示
  def index
    @questions = Question.all
    # p @questions
  end

  # 質問詳細ページ表示
  def show
    # p params[:id]
    @question = Question.find(params[:id])
    # p @question
  end

  # 質問の作成
  def new
    @question = Question.new
  end

  # 質問の登録
  def create
    # Questionモデルの初期化
    @question = Question.new(question_params)
    # QuestionモデルをDBへ保存
    if @question.save
      # 質問の保存に成功したら、showへリダイレクト
      redirect_to @question
    else
      # 保存前のバリデーションに失敗したら、question/newにエラーのハッシュを送る
      render 'new', status: :unprocessable_entity
    end
  end

  # 質問の編集
  def edit
      @question = Question.find(params[:id])
  end

  # 質問の更新
  def update
      @question = Question.find(params[:id])
      if @question.update(question_params)
        redirect_to @question
      else
        render 'edit', status: :unprocessable_entity
      end
  end

  # 質問の削除
  def destroy
      # idパラメータから質問を特定する
      @question = Question.find(params[:id])
      # 質問を削除する
      @question.destroy
      # 質問一覧画面にリダイレクトする
      redirect_to @questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :name, :content)
  end
end
