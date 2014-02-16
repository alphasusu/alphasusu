module SUSUFlavouredMarkdown

    @config = {
        :no_intra_emphasis => true,
        :tables => true,
        :fenced_code_blocks => true,
        :autolink => true,
        :disable_indented_code_blocks => true,
        :superscript => true,
        :highlight => true,
        :footnotes => true,
    }

    def self.body_renderer
        Redcarpet::Markdown.new(SUSUFlavouredMarkdown::HTML, @config)
    end

    def self.preview_renderer
        Redcarpet::Markdown.new(SUSUFlavouredMarkdown::HTMLWithPreview, @config)
    end

    class HTML < Redcarpet::Render::HTML
        def preprocess(full_document)
            full_document.gsub('~~', '')
        end
    end

    class HTMLWithPreview < Redcarpet::Render::HTML
        def preprocess(full_document)
            full_document.split('~~').first
        end
    end

end
