module Dinglehopper
  module Builder
    class Model
      def initialize(model, pack)
        @model = model
        @pack = pack
      end

      def has_one_relations
        model.reflect_on_all_associations(:has_one).map { |r| r.klass.name }
      end

      def has_many_relations
        model.reflect_on_all_associations(:has_many).map { |r| r.klass.name }
      end

      def belongs_to_relations
        model.reflect_on_all_associations(:belongs_to).map { |r| r.klass.name }
      end

      def in_pack?(other_pack)
        pack == other_pack
      end

      private

      attr_reader :model, :pack
    end
  end
end
