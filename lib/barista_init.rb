module BaristaInitializer

  def self.registered(app)
    # Find more options for Barista at:
    # https://github.com/Sutto/barista
    #
    Barista.configure do |c|

      # Change the root to use app/scripts
      #
      c.root = File.join(Padrino.root, "app", "assets", "coffee")

      # Change the output root, causing Barista to compile into public/coffeescripts
      #
      c.output_root = File.join(Padrino.root, "public", "jsc")

      # Change the output root for a framework:
      #
      # c.change_output_prefix! 'framework-name', 'output-prefix'

      # Or change the prefix for all frameworks, use #each_framework:
      #
      # c.each_framework do |framework|
      #   c.change_output_prefix! framework.name, "vendor/#{framework.name}"
      # end


      # Or, hook into the compilation:
      #
      # c.before_compilation          { |path|         puts "Barista: Compiling #{path}" }
      # c.on_compilation              { |path|         puts "Barista: Successfully compiled #{path}" }
      # c.on_compilation_error        { |path, output| puts "Barista: Compilation of #{path} failed with:
#{output}" }
      # c.on_compilation_with_warning { |path, output| puts "Barista: Compilation of #{path} had a warning:
#{output}" }
    end

    app.register Barista::Integration::Sinatra
  end
end
