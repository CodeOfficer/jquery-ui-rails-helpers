module AccordionsHelper
  
  def accordions_for( *options, &block )
    raise ArgumentError, "Missing block" unless block_given?
    
    accordions = AccordionsHelper::AccordionsRenderer.new( *options, &block )
    accordions_html = accordions.render
    concat accordions_html
  end
  
  class AccordionsRenderer
    
    def initialize( options={}, &block )
      raise ArgumentError, "Missing block" unless block_given?

      @template = eval( 'self', block.binding )
      @options = options
      @accordions = []

      yield self
    end
    
    def create( accordion_id, accordion_text, options={}, &block )
      raise "Block needed for AccordionsRenderer#CREATE" unless block_given?
      @accordions << [ accordion_id, accordion_text, options, block ]
    end
    
    def render      
      content_tag :div, { :id => :accordions }.merge( @options ) do
        @accordions.collect do |accordion|
          accordion_head(accordion) + accordion_body(accordion)
        end.join
      end
    end
    
    private #  ---------------------------------------------------------------------------
    
    def accordion_head(accordion)
      content_tag :h3, :id => accordion[0] do
        link_to accordion[1], '#'
      end
    end
    
    def accordion_body(accordion)
      content_tag :div do
        capture( &accordion[3] )
      end
    end
    
    def method_missing( *args, &block )
      @template.send( *args, &block )
    end
    
  end

end
