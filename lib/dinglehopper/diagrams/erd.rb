module Dinglehopper
  module Diagrams
    class ERD
      def initialize(models)
        @models = models
      end

      def print
        puts "erDiagram"

        models.each do |model|
          model.has_one_relations.each do |relation|

          end
        end
        CUSTOMER ||--o{ ORDER : places
        ORDER ||--|{ LINE-ITEM : contains
        CUSTOMER }|..|{ DELIVERY-ADDRESS : uses
      end

      private

      attr_reader :models
    end
  end
end
