
if ActiveRecord::Base.connection.adapter_name == 'MySQL'
  ActsAsTaggableOn.force_binary_collation = true
end
