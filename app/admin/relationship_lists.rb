ActiveAdmin.register RelationshipList do

 permit_params :connection_id, :mother_id, :father_id, :child1_id, :child2_id, :child3_id, :child4_id, :child5_id, :step_mother_id, :step_father_id, :sibling1_id, :sibling2_id, :sibling3_id, :sibling4_id, :partner_id, :husband_id, :wife_id
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
