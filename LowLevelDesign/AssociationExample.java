import java.util.*;

public class AssociationExample {
  

class Teacher {
    private String name;
    private List<Student> students;
    
    public Teacher(String name) {
        this.name = name;
        this.students = new ArrayList<>();
    }
    
    public void addStudent(Student student) {
        students.add(student);
    }
    
    public void showStudents() {
        System.out.println(name + " teaches:");
        for (Student student : students) {
            System.out.println(" - " + student.getName());
        }
    }
    
    public String getName() {
        return name;
    }
}

class Student {
    private String name;
    
    public Student(String name) {
        this.name = name;
    }
    
    public String getName() {
        return name;
    }
}

public class AssociationExample {
    public static void main(String[] args) {
        Teacher teacher1 = new Teacher("Mr. Smith");
        Teacher teacher2 = new Teacher("Mrs. Johnson");
        
        Student student1 = new Student("Alice");
        Student student2 = new Student("Bob");
        
        teacher1.addStudent(student1);
        teacher1.addStudent(student2);
        teacher2.addStudent(student2);
        
        teacher1.showStudents();
        teacher2.showStudents();
    }
}

}
