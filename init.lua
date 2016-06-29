wifi.setmode(wifi.STATIONAP)  
 wifi.sta.config("SENAI_IOT1","Mirelly98")  
 tmr.alarm(0, 500, 1, function()  
     if wifi.sta.getip()==nil then  
      print("Connecting to AP...")  
     else  
      tmr.stop(1)  
      tmr.stop(0)  
      print("Connected as: " .. wifi.sta.getip())  
     end  
   end)  
 cfg={}  
    cfg.ssid="intarwebs"  
    wifi.ap.config(cfg)  
    -- Simple DNS Proxy  
 -- 20150923 by Andy Reischle  
 -- Blog: www.AReResearch.net  
 -- Vids: www.youtube.com/AReResearch  
 --  
 -- Uses googles dns server 8.8.8.8  
 -- change to whatever suits you  
 cu=net.createConnection(net.UDP,0)  
 cu:on("receive",function(cu,c)   
   -- print("Got a reply")  
   s:send(c)  
   end)  
 s=net.createServer(net.UDP)  
 s:on("receive",function(s,d)  
   -- print ("Got a request!")  
   cu:connect(53,"8.8.8.8")  
   cu:send(d)   
   end)  
 s:listen(53)  
