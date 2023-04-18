package practice;

import java.util.ArrayList;

public class Classroom {
	public int capacity;
	public ArrayList<String> student;
	
	public  Classroom(int capacity ) {
	
		this.capacity = capacity;
		this.student = new ArrayList<student>();
		
	}
	
	public boolean addStudent(Student student) {
		if(student.size()>=capacity) {
			return false;
		}
		student.add(student);
		return true;
	}
}
	