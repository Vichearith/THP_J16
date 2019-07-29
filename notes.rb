gossip.erb

<% comments.each_with_index do |comment,index| if comment.gossip_id == id then%>
  <p>
  <a href="/gossips/<%=index%>"><%= index %><br/></a>
    <%= comment.author %><br/>
    <%= comment.content %>
  </p>
  <% end %>
<% end %>

controller.rb

get '/gossips/:id/comment/' do
  erb :comment, locals:  {gossip: Gossip.find(params['id'].to_i), id:params['id']} 
end

post '/gossips/:id/comment/' do
  Comment.new(params["id"].to_i, params["comment_author"], params["comment_content"]).save
  redirect '/'
end

gosip.erb
<a href="/gossips/<%=id%>/comment/">Commenter le potin</a>