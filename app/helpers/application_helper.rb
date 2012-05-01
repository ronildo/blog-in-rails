module ApplicationHelper
	def format_content(content)
	  # Allow only tags specified in tags options, likewise in attributes
	  content = sanitize(content, :tags => %w(b strong i em img), :attributes => %w(src))
	  # Add Support for Line Breajs
	  content = simple_format(content)
	  return content
	end
end
