module Puppet::Parser::Functions
  newfunction(:memory_percentage, :type => :rvalue) do |arg|
    p = arg[0].to_f / 100.0
    mb = lookupvar('memorysize_mb').to_f
    return (p * mb).round
  end
end
