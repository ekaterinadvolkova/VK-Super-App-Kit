# VK Super AppKit Test Assignment 

## Technical Task
* A dark matter search app needs a table with several trillion cells on the screen. <br>
* The cells contain time of the event and the sensor indications. <br>
* The task is to write an MVP without using external dependencies.<br>

## Solution
* Since the task did not mention the meaning of MVP, I assume it is a **Minimum Viable Product**
* Since the sensor data type is also not specified I assume it will be the **temperature**
* Therefore, I need to show on the UI date, time and temperature.
* Generate random data in JSON format
* Upload JSON to a project
* Decode JSON into struct containing date, time and temperature.
* Update the UI with async func because the amount of data is supposed to be huge (mildly speaking)
* I tested the solution with 500 values on iPhone device. It seems to work fast 😊

## Technologies used
* Cocoa Pods
* UIView
* Protocols etc.

## Screens on the test device

