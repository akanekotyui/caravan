class BlogsController < ApplicationController
	def index
		@blogs = Blog.all
	end

	def new
		#コントローラがblogsという名前なのでモデル名はblogになる
		@blog = Blog.new
		#@をつけるとビューに送ることができる
		#ブログモデルが入る空の箱（インスタンス）
	end

	def create
		blog = Blog.new(blog_params)
		#@なしだと送ることができない
		blog.save
		#create.html.erbはないのでリダイレクトする
		redirect_to '/blogs'
	end

	def show
		@blog = Blog.find(params[:id])
	end

	private #スコープがかわる
	#ビューからのデータはparamsというメソッドの中にはいっている。
	#ストロングパラメータはセキュリティを強固にしている（いるものだけをpermitしている)
	#rails4以降でblog_paramsができた。
		def blog_params
	        params.require(:blog).permit(:title, :body, :category)
	    end

end
