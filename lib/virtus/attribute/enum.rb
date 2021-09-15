# frozen_string_literal: true

module Virtus
  class Attribute

    # Type to be used inside attributes as enums.
    class Enum < Attribute

      primitive Axiom::Types::Symbol

      class << self

        attr_accessor :values

        # @param values [Array<Symbol>]
        def [](*values)
          klass = Class.new(self)
          klass.values = values
          klass
        end

        # :nodoc:
        def build_type(*)
          Axiom::Types::Symbol
        end

      end

      def coercion_error_message
        "Enum (#{self.class.values.join(',')})"
      end

      # @param value [Object]
      # @return [Boolean]
      def value_coerced?(value)
        self.class.values.include?(value)
      end

    end
  end
end
