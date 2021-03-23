module Log
  extend self

  enum Level
    Trace
    Debug
    Info
    Warn
    Error
    Fatal

    def color
      case self
      when Trace then "\x1b[94m"
      when Debug then "\x1b[36m"
      when Info  then "\x1b[32m"
      when Warn  then "\x1b[33m"
      when Error then "\x1b[31m"
      when Fatal then "\x1b[35m"
      end
    end

    def to_s
      super.to_s.upcase
    end
  end

  TIME_FORMAT = Time::Format.new("%H:%M:%S")

  @@level = Level::Trace
  @@use_color = false

  def level
    @@level
  end

  def level=(level)
    @@level = level
  end

  def use_color
    @@use_color
  end

  def use_color=(use_color)
    @@use_color = use_color
  end

  def log(level : Level, *objects, file = __FILE__, line = __LINE__)
    return if level < @@level
    time = TIME_FORMAT.format(Time.local)
    level_s = "%-5s" % level
    objects.each do |object|
      if @@use_color
        STDERR.puts("#{time} #{level.color}#{level_s}\x1b[0m \x1b[90m#{file}:#{line}:\x1b[0m #{object}")
      else
        STDERR.puts("#{time} #{level_s} #{file}:#{line}: #{object}")
      end
    end
  end

  def trace(*objects, file = __FILE__, line = __LINE__)
    log(Level::Trace, *objects, file: file, line: line)
  end

  def debug(*objects, file = __FILE__, line = __LINE__)
    log(Level::Debug, *objects, file: file, line: line)
  end

  def info(*objects, file = __FILE__, line = __LINE__)
    log(Level::Info, *objects, file: file, line: line)
  end

  def warn(*objects, file = __FILE__, line = __LINE__)
    log(Level::Warn, *objects, file: file, line: line)
  end

  def error(*objects, file = __FILE__, line = __LINE__)
    log(Level::Error, *objects, file: file, line: line)
  end

  def fatal(*objects, file = __FILE__, line = __LINE__)
    log(Level::Fatal, *objects, file: file, line: line)
  end
end
