module Dinglehopper
  module Mermaid
    class Graph
      def initialize
        @used_aliases = {}
        @aliases = ("A".."ZZZ").each
      end
      
      def graph_type
        raise 'Missing graph_type'
      end

      private

      def alias_for(pack)
        @used_aliases[pack] ||= @aliases.next
      end

      def print
        puts "```mermaid"
        puts "#{graph_type}"
        yield
        puts "```"
      end
    end
  end
end