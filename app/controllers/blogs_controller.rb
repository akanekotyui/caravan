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
		#このタイミングでコンソールに入る
	end

	def show
		@blog = Blog.find(params[:id])
	end

	def edit
        @blog = Blog.find(params[:id])
    end

    def update
        blog = Blog.find(params[:id])
        #ストロングパラメータ覚える
        blog.update(blog_params)
        #redirect_to パスの名前　覚える
        redirect_to blog_path(blog)
    end

	def destroy
		blog = Blog.find(params[:id])
		blog.destroy
		redirect_to blogs_path
	end


	private #スコープがかわる
	#ビューからのデータはparamsというメソッドの中にはいっている。
	#ストロングパラメータはセキュリティを強固にしている（いるものだけをpermitしている)
	#rails4以降でblog_paramsができた。
		def blog_params
	        params.require(:blog).permit(:title, :body, :category, :blog_image)
	       #params.require(モデル名).permit(:カラム名)
	    end

end
