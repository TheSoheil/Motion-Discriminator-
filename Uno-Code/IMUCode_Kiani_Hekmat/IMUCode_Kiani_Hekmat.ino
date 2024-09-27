#include "Wire.h"
#include <MPU6050_light.h>
#include <SD.h>

MPU6050 mpu(Wire);
int counter = 1;
long timer = 0;
File dataFile;

const int chipSelect = 10;  // Adjust this to your SD card module's chip select pin
const char* fileName = "Static.txt";

void setup() {
  Serial.begin(9600);
  Wire.begin();
  
  byte status = mpu.begin();
  Serial.print(F("MPU6050 status: "));
  Serial.println(status);
  while (status != 0) {
  } // stop everything if could not connect to MPU6050

  Serial.println(F("Calculating offsets, do not move MPU6050"));
  delay(1000);
  mpu.calcOffsets(true, true); // gyro and accelero
  Serial.println("Done!\n");

  // Initialize SD card
  if (SD.begin(chipSelect)) {
    Serial.println("SD card initialized.");
    dataFile = SD.open(fileName, FILE_WRITE);
    dataFile.println("Time,AccelX,AccelY,AccelZ,GyroX,GyroY,GyroZ,AccAngleX,AccAngleY,AngleX,AngleY,AngleZ");
  } else {
    Serial.println("SD card initialization failed.");
  }
}

void loop() {
  mpu.update();
  if(counter > 100){
    dataFile.close();
  }
  else{
    if (millis() - timer > 50) { // print data every second
      Serial.print(F("TEMPERATURE: ")); Serial.println(mpu.getTemp());
      Serial.print(F("ACCELERO  X: ")); Serial.print(mpu.getAccX());
      Serial.print("\tY: "); Serial.print(mpu.getAccY());
      Serial.print("\tZ: "); Serial.println(mpu.getAccZ());

      Serial.print(F("GYRO      X: ")); Serial.print(mpu.getGyroX());
      Serial.print("\tY: "); Serial.print(mpu.getGyroY());
      Serial.print("\tZ: "); Serial.println(mpu.getGyroZ());

      Serial.print(F("ACC ANGLE X: ")); Serial.print(mpu.getAccAngleX());
      Serial.print("\tY: "); Serial.println(mpu.getAccAngleY());

      Serial.print(F("ANGLE     X: ")); Serial.print(mpu.getAngleX());
      Serial.print("\tY: "); Serial.print(mpu.getAngleY());
      Serial.print("\tZ: "); Serial.println(mpu.getAngleZ());
      // Write data to SD card
      // if (dataFile) {
        dataFile.print(millis());  // Time in milliseconds
        dataFile.print(",");
        dataFile.print(mpu.getAccX());
        dataFile.print(",");
        dataFile.print(mpu.getAccY());
        dataFile.print(",");
        dataFile.print(mpu.getAccZ());
        dataFile.print(",");
        dataFile.print(mpu.getGyroX());
        dataFile.print(",");
        dataFile.print(mpu.getGyroY());
        dataFile.print(",");
        dataFile.print(mpu.getGyroZ());
        dataFile.print(",");
        dataFile.print(mpu.getAccAngleX());
        dataFile.print(",");
        dataFile.print(mpu.getAccAngleY());
        dataFile.print(",");
        dataFile.print(mpu.getAngleX());
        dataFile.print(",");
        dataFile.print(mpu.getAngleY());
        dataFile.print(",");
        dataFile.println(mpu.getAngleZ());
      // } else {
      //   Serial.println("Error writing to SD card.");
      // }
      counter = counter + 1;
      timer = millis();
    }
  }
}
