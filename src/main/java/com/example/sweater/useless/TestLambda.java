package com.example.sweater.useless;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

public class TestLambda {
    public static void main(String[] args) {
        Student student = new Student("Anton", "Oksianiuk1", 8.3);
        Student student1 = new Student("Anton", "Oksianiuk2", 9.3);
        Student student2 = new Student("Anton", "Oksianiuk3", 8.0);
        Student student3 = new Student("Anton", "Oksianiuk4", 4.3);
        Student student4 = new Student("Anton", "Oksianiuk5", 3.9);

        List<Student> studentList = new ArrayList<>();
        studentList.add(student);
        studentList.add(student1);
        studentList.add(student2);
        studentList.add(student3);
        studentList.add(student4);

        Collections.sort(studentList, (st1, st2) -> (int) (st1.getAvgGrade() * 10 - st2.getAvgGrade() * 10));
        for (Student s : studentList){
            System.out.println(s);
        }
    }

    void testStudent(List<Student> students, StudentCheck studentCheck){
        for (Student student : students){
            if (studentCheck.check(student)){
                System.out.println(student);
            }
        }
    }

}
