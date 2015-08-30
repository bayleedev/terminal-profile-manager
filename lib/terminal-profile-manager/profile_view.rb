class ProfileView
  attr_accessor :args

  def initialize(args)
    @args = args.map(&:downcase)
  end

  def list
    if args.include?('--remote')
      list_remote
    else
      list_local
    end
  end

  def list_local
    current = Profile.current
    default = Profile.default
    puts "Installed Profiles:"
    puts "\n"
    Profile.all.each do |profile|
      if current == profile && default == profile
        print ' =* '
      elsif current == profile
        print ' => '
      elsif default == profile
        print '  * '
      else
        print '    '
      end
      print profile + "\n"
    end
    puts "\n"
    puts "# => current"
    puts "# =* current && default"
    puts "#  * default"
  end

  def list_remote
    puts "Remote Profiles:"
    all = Profile.all
    Profile.all_remote.each do |name, details|
      next if all.include?(name)
      puts
      puts name + ' - ' + details['author']
      puts details['site']
    end
  end

  def use
    name = args.first
    profile = Profile.new
    unless Profile.all.map(&:downcase).include?(name)
      puts "Profile not installed."
      return
    end
    if args.include?('--default')
      profile.use_default(name)
      puts "Using #{name} as the default profile."
    end
    if args.include?('--all')
      profile.use_all(name)
      puts "Using #{name} as on all open terminals."
    else
      profile.use_current(name)
      puts "Using #{name} as on current terminal."
    end
  end

  def help
    [
      "Tasks:",
      "  tpm list [--remote]",
      "  tpm use PROFILE [--all] [--default]",
      "  tpm install NAME [URL] [--apply] [--default]",
      "  tpm help"
    ].each do |line|
      puts line
    end
  end
end
