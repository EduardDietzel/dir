package lessons.homework;

public class HomeWork2_1 {

    public static void main(String[] args) {

        int valueOne = 7;
        int valueTwo = 5;
        int x1 = 10 - valueOne;
        int x2 = 10 - valueTwo;
        System.out.printf("Есть два числа %s и %s", valueOne, valueTwo);
        System.out.println();

        if (valueOne < 10 && valueTwo < 10) {
            if (x2 > x1) {
                System.out.printf("Число %s ближайшее к 10", valueOne);
            } else {
                System.out.printf("Число %s ближайшее к 10", valueTwo);}
        } else {
            if (valueOne > 10 && valueTwo > 10) {
                if (x2 > x1) {
                    System.out.printf("Число %s ближайшее к 10", valueTwo);
                } else System.out.printf("Число %s ближайшее к 10", valueOne);
            }
        }
    }
}
