local nmap = require("nmap")
local shortport = require("shortport")

-- define the script arguments
local args = {}

-- declare the port rule
portrule = shortport.port_or_service({80, 443})

-- declare the action function
action = function(host, port)

  -- print the open port information
  nmap.output("Port %d is open on %s", port, host.ip)

end

-- declare the main function
function main()

  -- get the list of ports to scan
  local ports = portrule:getPorts()
  
  -- loop through each port and perform the action
  for _, port in ipairs(ports) do
    local status, err = nmap.new_socket():connect(host, port)
    if status then
      action(host, port)
    end
  end

end

-- declare the port scanning rule
portrule = shortport.port_or_service({80, 443})

-- register the script with Nmap
action = function(host, port)
  nmap.output("Port %d is open on %s", port, host.ip)
end

