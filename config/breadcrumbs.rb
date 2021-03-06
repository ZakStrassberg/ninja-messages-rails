crumb :root do
  link "Home", root_path
end

crumb :channels do
  link "Channels", channels_path
end

crumb :new_channel do
  link "New channel", new_channel_path
  parent :channels
end

crumb :channel do |channel|
  link channel.name, channel
  parent :channels
end

crumb :edit_channel do |channel|
  link "Edit channel", channel
  parent :channel, channel
end

# crumb :channel_conversations do |channel|
#   link "Conversations", channel_conversations_path(channel)
#   parent :channel, channel
# end

crumb :conversation do |conversation|
  link conversation.name, channel_conversations_path(conversation.channel, conversation)
  parent :channel, conversation.channel
end


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).