package practice;

import java.util.ArrayList;

public class School {
	ArrayList<String> student; 
	
	

	public ArrayList<String> getStudent() {
		return student;
	}

	public void setStudent(ArrayList<String> student) {
		this.student = student;
	}
	

	public School() {
		student = new ArrayList<>();
	}
	
	public static void main(String[] args) {
		
		
	ArrayList<Student> student = new ArrayList();
	student.addAll(student);
	
	}
	
}
