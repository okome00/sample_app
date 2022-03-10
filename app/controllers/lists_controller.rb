class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @list = List.new
  end

  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @list = List.new(list_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    if @list.save
      # 対象カラムにデータ入力されていれば、次のページにリダイレクト
      redirect_to list_path(@list.id)
    # 対象カラムにデータ入力されていなければ、新規投稿ページを再表示
    else
      render :new
    end
  end

  def index
    # listsテーブルに保存されたデータをすべて取得する
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    # ID情報を取得
    list = List.find(params[:id])
    # データベース内のデータを更新する
    list.update(list_params)
    #   詳細画面（showアクション）へリダイレクト
    redirect_to list_path(list.id)
  end

  def destroy
    # ID情報を取得
    list = List.find(params[:id])
    # データを削除
    list.destroy
    # 投稿一覧画面（indexアクション）へリダイレクト
    redirect_to '/lists'
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end

end
