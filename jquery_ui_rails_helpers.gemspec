# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "jquery_ui_rails_helpers"
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bearded Studio", "CodeOfficer", "Kristian Mandrup"]
  s.date = "2012-10-30"
  s.description = "JQuery UI helpers you can use in your Rails apps"
  s.email = [""]
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    ".rspec",
    "CHANGELOG",
    "Gemfile",
    "Gemfile.lock",
    "MIT-LICENSE",
    "README.md",
    "Rakefile",
    "VERSION",
    "init.rb",
    "install.rb",
    "jquery_ui_rails_helpers.gemspec",
    "lib/jquery_ui_rails_helpers.rb",
    "lib/jquery_ui_rails_helpers/accordion_helper.rb",
    "lib/jquery_ui_rails_helpers/autocomplete_helper.rb",
    "lib/jquery_ui_rails_helpers/button_helper.rb",
    "lib/jquery_ui_rails_helpers/buttonset_helper.rb",
    "lib/jquery_ui_rails_helpers/checkbox_helper.rb",
    "lib/jquery_ui_rails_helpers/daterange_helper.rb",
    "lib/jquery_ui_rails_helpers/dialog_helper.rb",
    "lib/jquery_ui_rails_helpers/fileinput_helper.rb",
    "lib/jquery_ui_rails_helpers/jquery_ui_base.rb",
    "lib/jquery_ui_rails_helpers/menu_helper.rb",
    "lib/jquery_ui_rails_helpers/progressbar_helper.rb",
    "lib/jquery_ui_rails_helpers/radio_helper.rb",
    "lib/jquery_ui_rails_helpers/rails/engine.rb",
    "lib/jquery_ui_rails_helpers/select_slider_helper.rb",
    "lib/jquery_ui_rails_helpers/slider_helper.rb",
    "lib/jquery_ui_rails_helpers/tabs_helper.rb",
    "lib/jquery_ui_rails_helpers/tree_helper.rb",
    "lib/jquery_ui_rails_helpers/tree_helper/ui_branch.rb",
    "lib/jquery_ui_rails_helpers/tree_helper/ui_leaf.rb",
    "lib/jquery_ui_rails_helpers/tree_helper/ui_tree.rb",
    "spec/examples/checkbox_radio.js",
    "spec/examples/full_menu.html",
    "spec/examples/menu.html",
    "spec/examples/ui.checkbox.js",
    "spec/flex.css",
    "spec/formtastic.html",
    "spec/jquery_ui_rails_helpers/accordion_helper_spec.rb",
    "spec/jquery_ui_rails_helpers/autocomplete_helper_spec.rb",
    "spec/jquery_ui_rails_helpers/button_helper_spec.rb",
    "spec/jquery_ui_rails_helpers/buttonset_helper_spec.rb",
    "spec/jquery_ui_rails_helpers/checkbox_helper_spec.rb",
    "spec/jquery_ui_rails_helpers/daterange_helper_spec.rb",
    "spec/jquery_ui_rails_helpers/dialog_helper_spec.rb",
    "spec/jquery_ui_rails_helpers/fileinput_helper_spec.rb",
    "spec/jquery_ui_rails_helpers/menu_helper_spec.rb",
    "spec/jquery_ui_rails_helpers/progressbar_helper_spec.rb",
    "spec/jquery_ui_rails_helpers/radiobutton_helper_spec.rb",
    "spec/jquery_ui_rails_helpers/radiobuttons_helper_spec.rb",
    "spec/jquery_ui_rails_helpers/select_slider_helper_spec.rb",
    "spec/jquery_ui_rails_helpers/slider_helper_spec.rb",
    "spec/jquery_ui_rails_helpers/tabs_helper_spec.rb",
    "spec/jquery_ui_rails_helpers/tree_helper_spec.rb",
    "spec/spec_helper.rb",
    "uninstall.rb",
    "vendor/assets/images/fileinput/bg-btn.png",
    "vendor/assets/images/fileinput/bg-submit.gif",
    "vendor/assets/images/fileinput/icon-generic.gif",
    "vendor/assets/images/fileinput/icon-image.gif",
    "vendor/assets/images/fileinput/icon-media.gif",
    "vendor/assets/images/fileinput/icon-zip.gif",
    "vendor/assets/images/tree/icon-file.gif",
    "vendor/assets/images/tree/icon-folder-open.gif",
    "vendor/assets/images/tree/icon-folder.gif",
    "vendor/assets/javascripts/date.js",
    "vendor/assets/javascripts/enhance.js",
    "vendor/assets/javascripts/fg.menu.jquery.js",
    "vendor/assets/javascripts/jquery-1.8.0.js",
    "vendor/assets/javascripts/jquery.selectboxes.js",
    "vendor/assets/javascripts/ui.button.jquery.js",
    "vendor/assets/javascripts/ui.checkbox.jquery.js",
    "vendor/assets/javascripts/ui.checkbox_radio.jquery.js",
    "vendor/assets/javascripts/ui.core.jquery.js",
    "vendor/assets/javascripts/ui.datepicker.js",
    "vendor/assets/javascripts/ui.daterange_picker.jquery.js",
    "vendor/assets/javascripts/ui.daterange_picker.jquery.min.js",
    "vendor/assets/javascripts/ui.fileinput.jquery.js",
    "vendor/assets/javascripts/ui.select_slider.jquery.js",
    "vendor/assets/javascripts/ui.selectmenu.jquery.js",
    "vendor/assets/javascripts/ui.sweet_daterange.js",
    "vendor/assets/javascripts/ui.sweet_input.js",
    "vendor/assets/javascripts/ui.sweet_menu.js",
    "vendor/assets/javascripts/ui.sweet_selectmenu.js",
    "vendor/assets/javascripts/ui.tree.jquery.js",
    "vendor/assets/javascripts/ui.widget.jquery.js",
    "vendor/assets/javascripts/util.date.js",
    "vendor/assets/stylesheets/fg.menu.jquery.css",
    "vendor/assets/stylesheets/jquery-ui.css",
    "vendor/assets/stylesheets/ui.checkbox.css",
    "vendor/assets/stylesheets/ui.checkbox_radio.css",
    "vendor/assets/stylesheets/ui.checkbox_radio_msoffice.css",
    "vendor/assets/stylesheets/ui.daterange_picker.css",
    "vendor/assets/stylesheets/ui.fileinput.css",
    "vendor/assets/stylesheets/ui.menu.css",
    "vendor/assets/stylesheets/ui.select_slider.css",
    "vendor/assets/stylesheets/ui.selectmenu.css",
    "vendor/assets/stylesheets/ui.sweet_input.css",
    "vendor/assets/stylesheets/ui.sweet_selectmenu.css",
    "vendor/assets/stylesheets/ui.tree.css"
  ]
  s.homepage = "https://github.com/beardedstudio/jquery_ui_rails_helpers"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "JQuery UI helpers you can use in your Rails apps"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<haml>, [">= 0"])
      s.add_development_dependency(%q<rails>, [">= 3"])
      s.add_development_dependency(%q<rspec>, [">= 2"])
      s.add_development_dependency(%q<rspec-rails>, [">= 2.5"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_development_dependency(%q<jeweler>, [">= 1.5.2"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<haml>, [">= 0"])
      s.add_dependency(%q<rails>, [">= 3"])
      s.add_dependency(%q<rspec>, [">= 2"])
      s.add_dependency(%q<rspec-rails>, [">= 2.5"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<jeweler>, [">= 1.5.2"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<haml>, [">= 0"])
    s.add_dependency(%q<rails>, [">= 3"])
    s.add_dependency(%q<rspec>, [">= 2"])
    s.add_dependency(%q<rspec-rails>, [">= 2.5"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<jeweler>, [">= 1.5.2"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end

