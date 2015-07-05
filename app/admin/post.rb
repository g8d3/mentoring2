ActiveAdmin.register Post do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params *Post.attribute_names
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

	index as: :grid do |post|
		link_to post.title, edit_admin_post_path(post)
	end

	controller do
		def resource_url; admin_posts_path end

	end

end
