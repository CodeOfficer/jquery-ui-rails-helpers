module AccordionsHelper
	def accordions_for( *options, &block )
		raise ArgumentError, "Missing block" unless block_given?
		raw AccordionsHelper::AccordionsRenderer.new( *options, &block ).render
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
			content = @accordions.collect do |accordion|
				accordion_head(accordion) << accordion_body(accordion)
			end.join
			content_tag( :div, raw(content), { :id => :accordions }.merge( @options ) )
		end

	private #	 ---------------------------------------------------------------------------

		def accordion_head(accordion)
			content_tag :h3, link_to(accordion[1], '#'), :id => accordion[0]
		end

		def accordion_body(accordion)
			content_tag( :div, &accordion[3] )
		end

		def method_missing( *args, &block )
			@template.send( *args, &block )
		end

	end
end

