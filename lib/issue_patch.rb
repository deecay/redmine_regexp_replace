# Encoding: utf-8

module RedmineRegexpReplace
  
      def self.included(base) # :nodoc:
        base.extend(ClassMethods)
        base.send(:include, InstanceMethods)

        base.class_eval do
           before_save  :replace_after_save
        end
     end

     module ClassMethods
     end

     module InstanceMethods

       def replace_after_save
         setting = [[Regexp.new(Setting.plugin_redmine_regexp_replace['from1']),
                     Setting.plugin_redmine_regexp_replace['to1']]]
         
         if self.class.name == "Issue" && self.description
           setting.each{|pair|
             self.description = self.description.gsub(pair[0], pair[1])
           }
         end

         if self.class.name =="Journal" && self.notes
           setting.each{|pair|
             self.notes = self.notes.gsub(pair[0], pair[1])
           }
         end
       end


     end
end
