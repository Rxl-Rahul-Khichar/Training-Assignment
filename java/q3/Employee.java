public class Employee implements Comparable<Employee> {
 
    private int age = -1;
    private String name = null;
    private String dept = null;
    private int id = -1;
    
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public String getDept() {
        return dept;
    }
 
    public Employee(int age, String name, int id, String dept) {
        this.age = age;
        this.name = name;
        this.id = id;
        this.dept = dept;
    }
 
    @Override
    public int compareTo(Employee o) {
        return this.age - o.age;
    }
 
    // Setters and Getters
 
    @Override
    public String toString() {
        return "Employee : " + age + " - " + name + " - " + id + " - " + dept + "\n";
    }
}
