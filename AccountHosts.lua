local fileread = io.open("D:/WAF/1.log","r")
local filewrite = io.open("D:/WAF/2.log","a")
local host = {}
local account = {}
local content = fileread:read()
while content do
----------------------------------------------------------------------
----------------------------------------------------------------------	
	local i,j = string.find(content,"\t.-\t")
	local hosta = string.sub(content,i+1,j-1)
	if #host == 0 then
		account[1] = 1
		host[1] = hosta
	else
		for k,hostb in ipairs(host) do
			if string.find(hosta,hostb) then
				account[k] = account[k] + 1
				break;
			elseif k == #host then
				account[#host+1] = 1
				host[#host+1] = hosta
				break;
			end	
		end
	end	
----------------------------------------------------------------------
----------------------------------------------------------------------	
	content = fileread:read()
end
local n = 1
while n <= #host do
	filewrite:write(host[n],"\t",account[n])
	filewrite:write("\n")
	n = n + 1
end	
io.close(fileread)
io.close(filewrite)
