package com.spring.main;

import java.util.Scanner;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.spring.machine.Calculator;

public class Main {

	public static void main(String[] args) {
		ApplicationContext ctx = new GenericXmlApplicationContext("classpath:com/spring/context/root-context.xml");
		Calculator cal = ctx.getBean("calculator", Calculator.class);	//(bean 등록할 때 주었던 ID, 값) 순서로 입력해 주면 됨

		System.out.print("두 개의 정수를 입력하세요. ex) 3 5");
		
		Scanner scan = new Scanner(System.in);
		
		int a = scan.nextInt();
		int b = scan.nextInt();
		
		scan.nextLine();	//nextInt() 등을 할떄는 한번 끊어주는 역할이 필요함(개행문자가 먹히기 때문)
		
//		Calculator cal = new Calculator();
		
		
		String result = "";
		
		System.out.println("1. 덧셈\t2. 뺄셈\t3. 곱셈\t4. 나눗셈");
		System.out.println("연산을 선택하세요.");
		
		String operator = scan.nextLine();
		
		switch (operator) {
		case "1":
			result = result + cal.sum(a, b);
			break;
		case "2":
			result = result + cal.minus(a, b);
			break;
		case "3":
			result = result + cal.multi(a, b);
			break;
		case "4":
			result = result + cal.div(a, b);
			break;
		default:
			System.out.println("연산 선택이 올바르지 않아 프로그램을 종료합니다.");
			return;
		}
		
		System.out.println("연산결과는 " + result + "입니다.");
	}

}
