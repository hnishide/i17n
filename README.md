# i17n
A little shortcut for I18n `t` method.

## Getting started
Add this to your Gemfile:

```
gem 'i17n'
```

Add these lines to your app_controller.rb so it looks like:

```
class ApplicationController < ActionController::Base

  include I17n::ControllerAdditive

end
```

## Usage

In controllers and views, you can write:

```
t User # shortcut for `User.model_name.human`
t User, :name # shortcut for `User.human_attribute_name(:name)`
t :hello # shortcut for `t "app.hello"`. It is usefull for app specific terms.

# of course, you still can use I18n in original manner.
t "some.term.deep.inside"
```
