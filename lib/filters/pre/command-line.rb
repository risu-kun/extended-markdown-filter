module Filters
  module PreFilter
    def format_command_line(text)
      text.gsub /^\n?\s*``` command-line(.+?)```/m do |block|
        block.gsub! /^\s*``` command-line/, '<pre class="command-line">'
        block.gsub! /^\s*```$/, "</pre>\n"
        block.gsub!(/^\s*\$ (.+)$/) { %(<span class="command">#{$1.rstrip}</span>) }
        block.gsub!(/^\s*(\# .+)$/) { %(<span class="comment">#{$1.rstrip}</span>) }
        block.gsub!(/^\s*> (.+)$/) { %(<span class="output">#{$1.rstrip}</span>) }

        block
      end
    end
  end
end
