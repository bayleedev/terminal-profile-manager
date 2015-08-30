class OsaTerminal
  def self.run(cmd)
    `osascript -e 'tell application "Terminal" to #{cmd}'`
  end
end
