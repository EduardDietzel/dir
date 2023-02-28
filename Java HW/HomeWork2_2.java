package lessons.homework;

import static java.lang.System.in;

import java.util.Scanner;


public class HomeWork2_2 {

    public static void main(String[] args) {
        System.out.print("Который сейчас час? Введите целое число часов: ");
        Scanner keyboard = new Scanner(System.in);


        int inputNumber = keyboard.nextInt();
        int timeToSleep = 22;
        int restOfTime = timeToSleep - inputNumber;

        if (restOfTime > 16) {
            System.out.println("Сейчас самое время спать.");
        } else
            if (restOfTime > 10 && restOfTime <= 16) {
                System.out.println("Не переживайте, до сна больше 10 часов.");
            } else
                if (restOfTime < 7) {
                    System.out.println("До сна осталось меньше 7 часов.");
                } else
                    if (restOfTime == 3) {
                        System.out.println("До сна 3 часа, если вы голодные, то надо успеть перекусить.");
                    } else
                        if (restOfTime == 2) {
                            System.out.println("До сна 2 часа, завершайте выполнение текущей работы.");
                        } else
                            if (restOfTime == 1) {
                                System.out.println("До сна 1 час, посмотрите перед сном что-то интересное, или почитайте.");
                            } else
                                if (restOfTime < 1) {
                                    System.out.println("Время ложиться спать. Конец дня!");
                                } else
                                    System.out.println("Время до сна " + restOfTime + " часов.");


    }
}
