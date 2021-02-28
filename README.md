# About this repository
Here you will find simple example code to implement and understand serial communication between Arduino and Processing. The primary goal of the examples here presented is **educational**: to teach how to exchange information between systems through the exchange of ASCII characters via serial connection.

# How to use the examples

To use the examples you need to upload the .ino code to the Arduino and run the corresponding .pde code to Processing. For example, if you load the code "Arduino_Processing_01.ino" to the Arduino, you need to run the code "Processing_Arduino_01.pde" in Processing. There are three pairs with increasing complexity (from the simplest 01 to the more complex 03).

Make sure the Arduino is connected to the computer via a USB cable. Open Processing and run the corresponding code. 

# Fundamentals
Data is sent between Arduino and Processing via serial port. It is important that the configuration of the serial port in the Arduino matches the configuration in Processing (both need to use the same COM port at the same baud rate). 

In the Arduino, characters are sent to the serial port via the function `Serial.print()` or `Serial.println()`. You can read characters using the command `Serial.read()`. 

In Processing, the callback function `serialEvent(Serial myPort)` will be called when a character is received via serial port. The function `myPort.write()` can be used to send a character to the serial port. 

## The examples
In this first example, the Arduino continuously send to Processing the value returned from reading the analogue value of port A0. At the same time, it will change the state of the pin `ledPin` if the character '1' is received from Processing.
Processing will print to the console the values received from the Arduino. If you click anywhere in the program screen, Processing will send the character '1' to the Arduino. 

The second and third examples follow the same principle, but with increase complexity in the communication. It is a good exercise to try to understand the code yourself. You can watch [this video](https://youtu.be/IawITwewga8) for a short explanation.

# License
This project is licensed under the terms of the MIT license.
