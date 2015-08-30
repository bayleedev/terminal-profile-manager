class ProfileController
  attr_accessor :arguments, :command, :view

  def run
    @command = (ARGV.first || :help).downcase.to_sym
    @arguments = ARGV[1..999] || []
    @view = ProfileView.new(arguments)
    if [:help, :list, :use].include?(command)
      view.send(command)
    elsif command == :install
      install
    else
      error "Command '#{command}' not found."
    end
  end

  def install
    name, path = arguments
    path ||= Profile.get_path(name)
    if path
      Profile.install(name, path)
      puts "Installed the '#{name}' terminal profile."
    else
      error "No profile for '#{name}' found. Try using a URL."
    end
  end

  def error(message)
    puts "EXCEPTION: #{message}"
    puts
    view.help
  end
end
