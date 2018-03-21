Rails.application.routes.draw do
	#urlを何も指定していない時の初期画面を設定
  root "blogs#index"

  #routes.rbで定義したルーティングはターミナルでrake routesと打つと確認できる
  #resouceはshow, editなど有名なルーティングは勝手に定義してくれる
  resources :blogs


end
