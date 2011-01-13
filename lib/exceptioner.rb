require 'exceptioner/core_ext/class/attribute'
require 'exceptioner/core_ext/module/attribute_accessors'
require 'exceptioner/version'
require 'exceptioner/railtie' if defined?(Rails::Railtie)

module Exceptioner

  class ExceptionerError < StandardError; end

  autoload :Middleware,       'exceptioner/middleware'
  autoload :ActionController, 'exceptioner/action_controller'
  
  module Transport
    autoload :Mail, 'exceptioner/transport/mail/mail'
    autoload :Jabber, 'exceptioner/transport/jabber/jabber'
  end

  # Define how to deliver exceptions data. 
  # For example :mail, :jabber, :irc
  mattr_accessor :transports
  @@transports = [:mail]

  # If true exceptions raised by local requests will be delivered
  # Note it is Rails 2.x specific setting
  mattr_accessor :dispatch_local_requests
  @@dispatch_local_requests = false

  # Name of current environment.
  # For rails it would be development, test or production.
  # It's included in exception notification.
  # You can also combine it with development_environments to decide
  # when to handle exceptions by Exceptioner.
  mattr_accessor :environment_name

  # Define development environment. For these environments exceptions will not
  # be handled by Exceptioner.
  mattr_accessor :development_environments
  @@development_environments = %w[development test cucumber]

  def self.setup
    yield self
  end

  def self.mail
    Transport::Mail
  end

  def self.jabber
    Transport::Jabber
  end

  def self.notify(exception, options = {})
    Notifier.dispatch(exception, options)
  end

end
