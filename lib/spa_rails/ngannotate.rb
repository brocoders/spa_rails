require 'ngannotate/processor'

module Ngannotate
  class Processor < Sprockets::Processor
    alias_method_chain :skip, :in_root

    def skip_with_in_root
      skip_witout_in_root || !@file.start_with?(::Rails.root.to_s)
    end
  end
end
