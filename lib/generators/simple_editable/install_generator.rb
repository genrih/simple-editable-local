require 'rails/generators/active_record'

module SimpleEditable
  class InstallGenerator < ActiveRecord::Generators::Base
    desc 'This installs simple editable gem with initializers and migrations'
    source_root File.expand_path("../templates", __FILE__)
    argument :name, type: :string, default: 'simple_editable'

    def create_initializer_file
      copy_file 'simple_editable.rb', 'config/initializers/simple_editable.rb'
    end

    def create_migrations
      migration_template 'migrations/create_simple_editable_inline_texts.rb', 'db/migrate/create_simple_editable_inline_texts.rb'
    end

    def install_assets
      template 'assets/init.js', 'app/assets/javascripts/simple_editable/init.js'
    end

    def setup_routes
      route 'mount SimpleEditable::Engine => "/simple_editable", as: "simple_editable"'
    end
  end
end
