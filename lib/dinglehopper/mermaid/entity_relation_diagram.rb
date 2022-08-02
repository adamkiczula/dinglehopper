module Dinglehopper
  module Mermaid
    class EntityRelationDiagram < Graph
      def build(models)
        print do
          models.each do |model|
            puts "#{model.name} {"
            model.columns.each do |column|
              puts "  #{column.type} #{column.name}"
            end
            puts "}"
          end
        end
      end

      def graph_type
        "erDiagram".freeze
      end
    end
  end
end