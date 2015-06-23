require 'redmine'


Rails.application.config.to_prepare do
  require_dependency 'issue'
  require_dependency 'issue_patch'
  unless Issue.included_modules.include? RedmineRegexpReplace
    Issue.send(:include, RedmineRegexpReplace)
  end

  require_dependency 'journal'
  unless Journal.included_modules.include? RedmineRegexpReplace
    Journal.send(:include, RedmineRegexpReplace)
  end

end




Redmine::Plugin.register :redmine_regexp_replace do
  name 'Redmine Regexp Replace plugin'
  author 'Daiju Kito'
  description 'Regexp Replace plugin for Redmine. Replace issue descriptions and journal entries when commiting.'
  version '0.0.1'
  settings :default => {},
           :partial => 'regexp_replace/settings'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end
