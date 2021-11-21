package com.example.sweater.useless;

public class Test {
    static void print(I i) {
        System.out.println(i.abc("privet"));
    }

    public static void main(String[] args) {
        int i = 10;

        print(s -> {
            System.out.println(i);
            return s.length() + i;
        });
    }

}

interface I {
    int abc(String s);
}
