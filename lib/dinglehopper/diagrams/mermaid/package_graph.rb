# frozen_string_literal: true


module Dinglehopper
  module Diagrams
    module Mermaid
      class PackageGraph
        GRAPH_TYPE = "graph TD".freeze

        def initialize
          @used_aliases = {}
          @aliases = ("A".."ZZZ").each
        end

        def build(packs)
          puts "```mermaid"
          puts "#{GRAPH_TYPE}"
          packs.each do |pack|
            pack.dependencies.each do |dependency|
              build_relation(pack.name, dependency)
            end
          end
          puts "```"
        end

        def build_shallow(pack)
          puts "```mermaid"
          puts "#{GRAPH_TYPE}"
          pack.dependencies.each do |dependency|
            build_relation(pack.name, dependency)
          end
          pack.dependents.each do |dependent|
            build_relation(dependent, pack.name)
          end
          puts "```"
        end
        
        private

        def alias_for(pack)
          @used_aliases[pack] ||= @aliases.next
        end

        def build_relation(pack, dependency)
          puts "    #{alias_for(pack)}(\"#{pack}\")-->#{alias_for(dependency)}(\"#{dependency}\")"
        end
      end
    end
  end
end