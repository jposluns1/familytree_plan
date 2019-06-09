ActiveAdmin.register Member do

 permit_params :user_id, :first_name, :last_name, :relationship_description, :birth_month, :birth_day, :birth_year, :gender, :location, :anniversary_month, :anniversary_day, :anniversary_year, :passed, :ex
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
