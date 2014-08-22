module Puppet::Parser::Functions
  newfunction(:memory_percentage, :type => :rvalue) do |arg|
    p = arguments[0].to_f / 100.0
    mb = lookupvar(memorysize_mb)
    return (p * a).round
  end
end
