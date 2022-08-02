# frozen_string_literal: true

require 'singleton'

module Dinglehopper
  module Builder
    class CodeLoader
      include Singleton
      ROOT_PACK = "."

      def packs
        @packs ||= Packwerk::PackageSet.load_all_from(ROOT_PACK)
      end

      def models
        return @models if defined? @models

        Rails.application.eager_load!
        @models = ActiveRecord::Base.descendants.reject(&:abstract_class?)
      end

      def models_by_pack
        return @models_by_pack if @models_by_pack

        package_names = packs.map(&:name)
        package_names.delete(ROOT_PACK)

        @models_by_pack = models.each_with_object(Hash.new { |h, k| h[k] = [] }) do |model, h|
          path = Object.const_source_location(model.name).first
          relative_path = path.sub("#{Rails.root}/", "")
          package = package_names.find { |name| relative_path.starts_with?(name) }
          package ||= ROOT_PACK
          h[package] << model
        end
      end
    end
  end
end
