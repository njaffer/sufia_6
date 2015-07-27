require 'blacklight_advanced_search/parsing_nesting_parser'

# This module gets included into CatalogController, or another SearchHelper
# includer, to add behavior into search_params_logic. 
module BlacklightAdvancedSearch::Controller
  extend ActiveSupport::Concern

  included do
    # default adv config values
    self.blacklight_config.advanced_search ||= Blacklight::OpenStructWithHashAccess.new
    #self.blacklight_config.advanced_search[:qt] ||= 'advanced'
    self.blacklight_config.advanced_search[:url_key] ||= 'advanced'
    self.blacklight_config.advanced_search[:query_parser] ||= 'dismax'
    self.blacklight_config.advanced_search[:form_solr_parameters] ||= {}    
    
    
    if self.respond_to? :search_params_logic
      # Parse app URL params used for adv searches 
      self.search_params_logic += [:add_advanced_search_to_solr]
    end

    if self.blacklight_config.search_builder_class
    self.blacklight_config.search_builder_class.send(:include,  
              BlacklightAdvancedSearch::AdvancedSearchBuilder  
          ) unless
          self.blacklight_config.search_builder_class.include?(   
              BlacklightAdvancedSearch::AdvancedSearchBuilder 
            )
    end
          
          
    # Display advanced search constraints properly
    helper BlacklightAdvancedSearch::RenderConstraintsOverride
    helper BlacklightAdvancedSearch::CatalogHelperOverride
    helper_method :is_advanced_search?, :advanced_query
  end
  
  def is_advanced_search? req_params = params
    (req_params[:search_field] == self.blacklight_config.advanced_search[:url_key]) ||
    req_params[:f_inclusive]
  end

  def advanced_query
    BlacklightAdvancedSearch::QueryParser.new(params, self.blacklight_config ) if is_advanced_search?  
  end
  
end

  


  

