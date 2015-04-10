require 'ngannotate/processor'

module Ngannotate
  class Processor < Sprockets::Processor
    def skip_with_in_root
      skip_without_in_root || !@file.start_with?(::Rails.root.to_s)
    end

    alias_method_chain :skip, :in_root
  end
end
