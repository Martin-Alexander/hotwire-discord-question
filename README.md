I have a very simple tabbed component.

You go to `/fruits` and you can then switch between "apples" and "grapes" without the page reloading thanks to Turbo Frames.

The views look like this:

```
<!-- app/views/fruits/index.html.erb -->

<%= turbo_frame_tag 'fruits' do %>
  <%= link_to 'Apples', apples_path %>
  <%= link_to 'Grapes', grapes_path %>
<% end %>

```

```
<!-- app/views/grapes/index.html.erb -->

<%= turbo_frame_tag 'fruits' do %>
  <%= link_to 'Apples', apples_path %>
  <%= link_to 'Grapes', grapes_path %>

  <ul>
    <% @grapes.each do |grape| %>
      <li><%= grape %></li>
    <% end %>
  </ul>
<% end %>
```

```
<!-- app/views/apples/index.html.erb -->

<%= turbo_frame_tag 'fruits' do %>
  <%= link_to 'Apples', apples_path %>
  <%= link_to 'Grapes', grapes_path %>

  <ul>
    <% @apples.each do |apples| %>
      <li><%= apple %></li>
    <% end %>
  </ul>
<% end %>
```

But when a user clicks on one of the tabs, I want to be able to redirect them to the home page. Importantly, I want the controller alone to have the power to decided if that redirect should happen

So something like this:

```ruby
# app/controllers/grapes_controller.rb

class GrapesController < ApplicationController
  def index
    @grapes = ['Green grapes', 'Red grapes']

    if Time.now.hour > 12 # if it's passed noon
      redirect_to '/'
    end
  end
end
```

Based on what I've read, this is just not possible with Turbo Frames. But it seems this is also not possible with Turbo Streams. So I'm quite confused...