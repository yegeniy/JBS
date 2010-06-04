class SayController < ApplicationController
      def hello
        @time = Time.now
      end
      
      def goodbye
        @files ||= "files list should be here"
        @files = Dir.glob('*')
      end
end
