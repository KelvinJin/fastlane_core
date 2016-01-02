module FastlaneCore
  # Exception that is thrown when the user did something wrong (e.g. invalid parameters)
  class UserError < StandardError
  end

  # Abstract super class
  class Interface
    #####################################################
    # @!group Messaging: show text to the user
    #####################################################

    # Level Error: Can be used to show additional error
    #   information before actually raising an exception
    #   or can be used to just show an error from which
    #   fastlane can recover (much magic)
    #
    #   By default those messages are shown in red
    def error(_message)
      not_implemented(__method__)
    end

    # Level Important: Can be used to show warnings to the user
    #   not necessarly negative, but something the user should
    #   be aware of.
    #
    #   By default those messages are shown in yellow
    def important(_message)
      not_implemented(__method__)
    end

    # Level Success: Show that something was successful
    #
    #   By default those messages are shown in green
    def success(_message)
      not_implemented(__method__)
    end

    # Level Message: Show a neutral message to the user
    #
    #   By default those messages shown in white/black
    def message(_message)
      not_implemented(__method__)
    end

    # Level Command: Print out a terminal command that is being
    #   executed.
    #
    #   By default those messages shown in cyan
    def command(_message)
      not_implemented(__method__)
    end

    # Level Command Output: Print the output of a command with
    #   this method
    #
    #   By default those messages shown in magenta
    def command_output(_message)
      not_implemented(__method__)
    end

    # Level Verbose: Print out additional information for the
    #   users that are interested. Will only be printed when
    #   $verbose = true
    #
    #   By default those messages are shown in white
    def verbose(_message)
      not_implemented(__method__)
    end

    # Print a header = a text in a box
    #   use this if this message is really important
    def header(_message)
      not_implemented(__method__)
    end

    #####################################################
    # @!group Errors: Inputs
    #####################################################

    # Is is possible to ask the user questions?
    def interactive?(_message)
      not_implemented(__method__)
    end

    # get a standard text input (single line)
    def input(_message)
      not_implemented(__method__)
    end

    # A simple yes or no question
    def confirm(_message)
      not_implemented(__method__)
    end

    # Let the user select one out of x items
    # return value is the value of the option the user chose
    def select(_message, _options)
      not_implemented(__method__)
    end

    # Password input for the user, text field shouldn't show
    # plain text
    def password(_message)
      not_implemented(__method__)
    end

    #####################################################
    # @!group Errors: Different kinds of exceptions
    #####################################################

    # Pass an exception to this method to exit the program
    #   using the given exception
    def crash!(_exception)
      not_implemented(__method__)
    end

    # Use this method to exit the program because of an user error
    #   e.g. app doesn't exist on the given Developer Account
    #        or invalid user credentials
    # This will show the error message, but doesn't show the full
    #   stack trace
    def user_error!(_error_message)
      not_implemented(__method__)
    end

    #####################################################
    # @!group Helpers
    #####################################################
    def not_implemented(method_name)
      raise "Current UI '#{self}' doesn't support method '#{method_name}'".red
    end

    def to_s
      self.class.name.split('::').last
    end
  end
end
