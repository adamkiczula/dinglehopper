require 'graph'

module Dinglehopper
  module Mermaid
    class PackageGraph < Graph
      # ROOT_PATH = "https://gitlab.com/adamkiczula/website/-/blob/main".freeze

      def build(pack_dependencies)
        print do
          pack_dependencies.each do |pack, dependencies|
            dependencies.each do |dependency|
              puts "    #{alias_for(pack)}(\"#{pack}\")-->#{alias_for(dependency)}(\"#{dependency}\")"
            end
            # puts "    click #{alias_for(pack)} \"#{ROOT_PATH}#{path_for(pack)}/README.md\""
            puts "    click #{alias_for(pack)} \"https://github.com/shageman/package-based-rails-applications-book/tree/main/c6s04-2b/sportsball/#{path_for(pack)}\""
          end
        end
      end

      def graph_type
        "graph TD".freeze
      end

      def path_for(pack)
        pack == "." ? "" : "/#{pack}"
      end
    end
  end
end
