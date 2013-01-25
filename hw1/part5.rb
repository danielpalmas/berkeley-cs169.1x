class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s   # make sure it's a string
    attr_reader attr_name        # create the attribute's getter

    class_eval <<-END
      def #{attr_name}=(value)
        self.#{attr_name}_history << value
        @#{attr_name} = value
      end

      def #{attr_name}_history
        @#{attr_name}_history ||= [nil]
      end
    END
  end
end
