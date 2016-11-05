# <h1>Give <%=@course.user.username%> a boost, cheer them on!</h1>
# <h2><%=@course.course_title%></h2>
# # <h3><%=@course.oldest_task.title%></h3>

#  <% if @cheer.errors.any? %>
#    <div id="error_explanation">
#     <h2>
#       <%= pluralize(@cheer.errors.count, "error") %>
#        prohibited this course from being saved:
#      </h2>
 
#      <ul>
#      <% @cheer.errors.full_messages.each do |msg| %>
#        <li><%= msg %></li>
#      <% end %>
#      </ul>
#    </div>
#  <% end %>

