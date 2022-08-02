module Dinglehopper
  module Builder
    class Package
      def self.all
        CodeLoader.instance.packs.map { |p| new(p) }
      end

      delegate :dependencies, :name, to: :package

      def initialize(package)
        @package = package
      end

      def models
        CodeLoader.instance.models_by_pack(name)
      end

      def dependents
        @dependents ||= self.class.all.select { |p| p.dependencies.include?(name) }.map(&:name)
      end

      private

      attr_reader :package
    end
  end
end
