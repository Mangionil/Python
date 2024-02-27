from bluepy.btle import Scanner
from peewee import MySQLDatabase, Model, CharField, IntegerField, FloatField, DateTimeField
import datetime

db = MySQLDatabase("msql", user="pi", password="raspberry", host="localhost")


class Data(Model):
    temperature = FloatField()
    humidity = FloatField()
    battery = FloatField()
    mac_address = CharField()
    timestamp = DateTimeField(default=datetime.datetime.now)

    class Meta:
        database = db


db.connect()
db.create_tables([Data])
db.close()

scanner = Scanner()
print("Begin device scan")
while True:
    devices = scanner.scan(timeout=3.0)

    for device in devices:
        if (
            device.addr == "d6:1c:bf:b7:76:62"
            or device.addr == "d7:ef:13:27:15:29"
            or device.addr == "d6:c6:c7:39:a2:e8"
        ):
            print(
                f"Device found {device.addr} ({device.addrType}), "
                f"RSSI={device.rssi} dB"
            )
            for adtype, description, value in device.getScanData():
                if adtype == 22:
                    Battery = int(value[20:22], 16)
                    Temperature = int(value[24:28], 16) / 100
                    Humidity = int(value[28:32], 16) / 100

                    print("Battery : ", Battery, " %")
                    print("Temperature : ", Temperature, " °C")
                    print("Humidity : ", Humidity, " %")

                    Data.create(temperature=Temperature, battery=Battery, humidity=Humidity, mac_address=device.addr)
