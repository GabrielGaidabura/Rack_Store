require_relative "../ERB_Context.rb"
require "erb"

class TemplateController
	def initialize(hash)
		@context = ERB_Context.new(hash)
	end
	def render(template, layout = nil)
		view = ERB.new(File.read(template)).result(@context.get_binding)
		if layout
			ERB.new(File.read(layout)).result(@context.get_binding{view})			
		else
			view
		end
	end
end