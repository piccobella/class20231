package common;

public class Person {
	
	/* 자바 빈즈 java beans - 자바로 작성한 소프트 웨어 컴포넌트
	 * 1. 기본 패키지 이외에 패키지에 위치
	 * 2.멤버변수의 접근 제한자는 private 으로 선언
	 * 3.기본 생성자 필수 
	 * 4. 멤버변수에 접근할 수 있는 getter/ setter 메소드 필요
	 * 5. getter/setter는 public 선언 
	 * 
	 * VO(value object) 값 객체-데이터를 담고 있는 객체
	 * DTO(Data Transfer Object)데이터 전송 객체 우리가 person 이라는 DTO를 만들었음 
	 * 
	 * */
	
	//맴버변수
	private String name;
	private int age;
	
	
	//생셩자
	public Person() {}
	public Person(String name,int age) {
		this.name=name;
		this.age=age;
	}
	
	
	
	// 메서드 
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name=name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age=age;
	}
	
	
}









