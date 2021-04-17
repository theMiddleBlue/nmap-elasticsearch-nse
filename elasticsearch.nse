description = [[
Attempts to enumerate indices, plugins and cluster nodes on a target elasticsearch
exposing an unauthenticated HTTP port (default 9200/tcp) using the elasticsearch RESTful API.
]]

author = "theMiddle"

license = "Same as Nmap--See https://nmap.org/book/man-legal.html"

categories = {"discovery", "version"}

local http = require "http"
local string = require "string"
local json = require "json"

portrule = function(host, port)
  return port.protocol == "tcp" and port.state == "open"
end

action = function(host, port)
  local uri = "/"
  local response = http.get(host, port, uri)
  if ( response.status == 200 ) then
    if ( string.find(response.body, "You Know, for Search") ) then
      local out = "by theMiddle (Twitter: @Menin_TheMiddle)\n\n"
      out = out .. "found RESTful API\n"
      err, esjson = json.parse(response.body)

      out = out .. "version: ".. esjson['version']['number'] .."\n"

      if esjson['cluster_name'] then
        out = out .. "cluster name: " .. esjson['cluster_name'] .. "\n"
      end

      out = out .. "\nIndices found in /_cat/indices:\n"
      local resindices = http.get_url("http://"..host.ip..":"..port.number.."/_cat/indices?pri&v&h=health,index,docs.count")
      out = out .. resindices.body

      out = out .. "\nPlugins found in /_cat/plugins:\n"
      local resplugins = http.get_url("http://"..host.ip..":"..port.number.."/_cat/plugins")
      out = out .. resplugins.body

      out = out .. "\nNodes found in /_cat/nodes:\n"
      local resnodes = http.get_url("http://"..host.ip..":"..port.number.."/_cat/nodes")
      out = out .. resnodes.body

      out = out .. "\nNodes process:\n"
      local resprocess = http.get_url("http://"..host.ip..":"..port.number.."/_nodes/_all/process")
      err, psjson = json.parse(resprocess.body)

      for key,value in pairs(psjson['nodes']) do
        out = out .. " - Name: " .. value['name'] .. "\n"
        out = out .. " - Transport Address: " .. value['transport_address'] .. "\n"
        out = out .. " - Host: " .. value['host'] .. "\n"
        out = out .. " - IP: " .. value['ip'] .. "\n"
        out = out .. " - Version: " .. value['version'] .. "\n\n"
      end

      return out
    end
  end
end
