#pragma once
#include <iostream>

class Date {
private:
    int day;
    int month;
    int year;

public:
    // Constructor to initialize the Date object
    Date(int d, int m, int y) : day(d), month(m), year(y) {}

    // Function to output the date in the format dd/mm/yyyy
    void Output() {
        std::cout << day << '/' << month << '/' << year << std::endl;
    }

    // Function to increase the date by 1 day
    void IncreaseOneDay() {
        day++;
        if (day > 31) {
            day = 1;
            month++;
            if (month > 12) {
                month = 1;
                year++;
            }
        }
    }

    // Function to increase the date by n days
    void IncreaseNDays(int n) {
        for (int i = 0; i < n; i++) {
            IncreaseOneDay();
        }
    }

    // Function to decrease the date by 1 day
    void DecreaseOneDay() {
        day--;
        if (day < 1) {
            month--;
            if (month < 1) {
                month = 12;
                year--;
            }
            day = GetDaysInMonth(month, year);
        }
    }

    // Function to decrease the date by n days
    void DecreaseNDays(int n) {
        for (int i = 0; i < n; i++) {
            DecreaseOneDay();
        }
    }

private:
    // Helper function to get the number of days in a month
    int GetDaysInMonth(int m, int y) {
        switch (m) {
            case 4: case 6: case 9: case 11:
                return 30;
            case 2:
                if ((y % 4 == 0 && y % 100 != 0) || (y % 400 == 0))
                    return 29;
                else
                    return 28;
            default:
                return 31;
        }
    }
};

