module Virtus
  class Attribute

    # Coercer accessor wrapper
    #
    # @api private
    class Coercer < Virtus::Coercer

      # @api private
      attr_reader :method, :coercers

      # Initialize a new coercer object
      #
      # @param [Object] coercers accessor
      # @param [Symbol] coercion method
      #
      # @return [undefined]
      #
      # @api private
      def initialize(type, coercers)
        super(type)
        @method   = type.coercion_method
        @coercers = coercers
      end

      # Coerce given value
      #
      # @return [Object]
      #
      # @api private
      def call(value)
        call_method = (method == :to_hash && value.kind_of?(Hash)) ? :itself : method
        coercers[value.class].public_send(call_method, value)
      rescue ::Coercible::UnsupportedCoercion
        value
      end

      # @api public
      def success?(primitive, value)
        coercers[primitive].coerced?(value)
      end

    end # class Coercer

  end # class Attribute
end # module Virtus
