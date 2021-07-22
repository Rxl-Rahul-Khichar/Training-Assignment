import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


public class TestSorting {
    public static void main(String[] args) {
        Employee e1 = new Employee(21, "Rahul", 1237, "Engineering");
        Employee e2 = new Employee(22, "Manish", 1236, "Engineering");
        Employee e3 = new Employee(25, "Divyansh", 1235, "Operations");
        Employee e4 = new Employee(29, "Sarthak", 1234, "HR");
 
        List<Employee> employees = new ArrayList<Employee>();
        employees.add(e2);
        employees.add(e3);
        employees.add(e1);
        employees.add(e4);
 
        // UnSorted List
        System.out.println(employees);
 
        Collections.sort(employees);
        // Default Sorting by employee age
        System.out.println(employees);
        
        Collections.sort(employees, new NameSorter());
        // Sorted by Name
        System.out.println(employees);
 
        Collections.sort(employees, new IdSorter());
        // Sorted by Id
        System.out.println(employees);
 
        Collections.sort(employees, new DeptSorter());
        // Sorted by Department
        System.out.println(employees);
    }
}

