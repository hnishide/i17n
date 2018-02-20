module I17n

  def self.t(*args)
    if args[0].respond_to?(:model_name)
      if args[1] && args[1].is_a?(Symbol)
        args[0].human_attribute_name(*args.drop(1))
      else
        args[0].model_name.human(*args.drop(1))
      end
    elsif args[0].is_a?(Symbol)
      I18n.t("app.#{args[0]}", *args.drop(1))
    else
      I18n.t(*args)
    end
  end

  def self.method_missing(*args)
    I18n.send(args[0], *args.drop(1))
  end

  module ControllerAdditive
    extend ActiveSupport::Concern

    included do
      helper_method :t
    end

    def t(*args)
      I17n.t(*args)
    end
  end

end
