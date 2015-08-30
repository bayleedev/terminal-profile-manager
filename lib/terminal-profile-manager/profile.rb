require 'json'
require 'pry'

class Profile
  def self.all
    OsaTerminal.run('get name of every settings set').split(', ').map do |profile|
      profile.strip
    end
  end

  def self.all_remote
    path = File.dirname(__FILE__)
    @remote_all ||= JSON.parse(File.read(path + '/../../profiles.json'))
  end

  def self.current
    OsaTerminal
      .run('get name of current settings of selected tab of front window')
      .strip
  end

  def self.default
    OsaTerminal
      .run('get name of default settings')
      .strip
  end

  def self.install(name, path)
    system "curl -L -o installed/#{name}.terminal #{path}"
    system "open installed/#{name}.terminal"
    OsaTerminal
      .run('do script "exit" in window 1')
  end

  def self.get_path(name)
    info = self.all_remote[name]
    info and info['url']
  end

  def use_default(name)
    OsaTerminal
      .run("set default settings to settings set \"#{name}\"")
  end

  def use_current(name)
    OsaTerminal
      .run("set current settings of window 0 to settings set \"#{name}\"")
  end

  def use_all(name)
    OsaTerminal
      .run("set current settings of tabs of windows to settings set \"#{name}\"")
  end
end