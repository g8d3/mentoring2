class PostsController < InheritedResources::Base
	respond_to :html, :json
	before_filter :allow_origin
	skip_before_filter :verify_authenticity_token
	before_filter :authenticate_user!, only: :index

	def save
		File.write Rails.root.join('public', params[:path]), params[:data]
		render json: {}
	end


	private

	def allow_origin
		headers['Access-Control-Allow-Origin'] = '*'
		headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
		headers['Access-Control-Request-Method'] = '*'
		headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
	end

	def post_params
		params.require(:post).permit!
	end
end

