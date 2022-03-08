class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @list = List.new
  end

  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    list.save
    # redirect_to '/top'を削除して、下記コードに変更
    # 詳細画面へリダイレクト
    redirect_to list_path(list.id)
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
    # ID情報を取り出す
    list = List.find(params[:id])
    # データベース内のデータを更新する
    list.update(list_params)
    # showアクションへリダイレクトする
    redirect_to list_path(list.id)
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end

end
