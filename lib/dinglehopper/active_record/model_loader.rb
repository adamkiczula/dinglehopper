module Dinglehopper
  module ActiveRecord
    class ModelLoader
      def all
        Rails.application.eager_load!
        models = []
        ActiveRecord::Base.descendants.each do |model|
          next if model.abstract_class?
          next unless table_exists?(model)
          models << model
        end
        models
      end

      def table_exists?(model)
        model.columns
        true
      rescue ActiveRecord::StatementInvalid
        false
      end
    end
  end
end