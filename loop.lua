--///////////////////////////////////////////
--//arquivo principal mqtt com sensor dht11//
--///////////////////////////////////////////

--/////////////////////////////////
--//configuração do servidor mqtt//
--/////////////////////////////////
print("entrando no arquivo loop")
broker = gw
port = 1883
topic = "teste"
clientid = "ESP12Client"
keepalive = 120
username = ""
password = ""
t = ""
temp = 0
temp_dec = 0
humi = 0
humi_dec = 0
pin = 3
-- GPIO0 = 3 GPIO2 = 4
function leitura()
status, temp, humi = dht.read(pin)
if status == dht.OK then
    -- Integer firmware using this example
    t="temperatura: "..temp.." humidade: "..humi
    print(t)
    m = mqtt.Client(nil,500,nil,nil)
    c = m:connect(broker, 1883, 0, publica)                               
end
end 
function publica()

tempf = (temp*9)/5+32
print (tempf)
m:publish("ESP12E-01/PUT/sensors/tempc",temp,0,0, function(client) print("sent")end)
m:publish("ESP12E-01/PUT/sensors/tempf",tempf,0,0, function(client) print("sent")end)
m:publish("ESP12E-01/PUT/sensors/humi",humi,0,0, function(client) print("sent")end)
end
tmr.alarm(2, 5000, 1, function() leitura() end )
