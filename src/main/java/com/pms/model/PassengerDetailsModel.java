package com.pms.model;

import java.util.ArrayList;
import java.util.Random;

public class PassengerDetailsModel {
	
	private static final ArrayList<Long> usedpnrs = new ArrayList<>();
	private static final Random random = new Random();
	public static long generateUniquepnrs()
	{
		long pnr;
		do {
			pnr = 1000000000L +(long)(random.nextDouble()*9000000000L);
			
		}while(usedpnrs.contains(pnr));
		usedpnrs.add(pnr);
		return pnr;
	}
	
      private long pnr;
      private String passengerName;
      private int age;
      private String gender;
      private int trainNumber;
      private String origin;
      private String destination;
      private int price;


public long getPnr() {
	return pnr;
}

public String getPassengerName() {
	return passengerName;
}
public void setPassengerName(String passengerName) {
	this.passengerName = passengerName;
}
public int getAge() {
	return age;
}
public void setAge(int age) {
	this.age = age;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
public int getTrainNumber() {
	return trainNumber;
}
public void setTrainNumber(int trainNumber) {
	this.trainNumber = trainNumber;
}
public String getOrigin() {
	return origin;
}
public void setOrigin(String origin) {
	this.origin = origin;
}
public String getDestination() {
	return destination;
}
public void setDestination(String destination) {
	this.destination = destination;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public PassengerDetailsModel(String passengerName, int age, String gender, int trainNumber, String origin,
		String destination, int price) {
	super();
	this.pnr =generateUniquepnrs() ;
	this.passengerName = passengerName;
	this.age = age;
	this.gender = gender;
	this.trainNumber = trainNumber;
	this.origin = origin;
	this.destination = destination;
	this.price = price;
}



}
//PNR INTEGER primary key,
//PassengerName varchar(255),
//age int(4),
//Gender varchar(15),
//TrainNumber int(10),
//Origin varchar(255),
//Destination varchar(255),
//price int(5)


//import java.util.*;
//public class Passenger
//{
//	private static final ArrayList<Long> usedpnrs = new ArrayList<>();
//	private static final Random random = new Random();
//	public static long generateUniquepnrs()
//	{
//		long pnr;
//		do {
//			pnr = 1000000000L +(long)(random.nextDouble()*9000000000L);
//			
//		}while(usedpnrs.contains(pnr));
//		usedpnrs.add(pnr);
//		return pnr;
//	}
//	
//    long PNR;
//    String Passengername;
//    int age;
//    String gender;
//	String orgin ;
//	String Destination;
//	int Trainnumber;
//	int Ticketprice;
//    public Passenger(String passengername, int age, String gender, String orgin,
//			String destination, int trainnumber, int ticketprice) {
//	
//		this.PNR = generateUniquepnrs();;
//		this.Passengername = passengername;
//		this.age = age;
//		this.gender = gender;
//		this.orgin = orgin;
//		this.Destination = destination;
//		this.Trainnumber = trainnumber;
//		this.Ticketprice = ticketprice;
//	}
//	public long getPNR() {
//		return this.PNR;
//	}
//	public void setPNR(long pNR) {
//		this.PNR = pNR;
//	}
//	public String getPassengername() {
//		return this.Passengername;
//	}
//	public void setPassengername(String passengername) {
//		this.Passengername = passengername;
//	}
//	public int getAge() {
//		return this.age;
//	}
//	public void setAge(int age) {
//		this.age = age;
//	}
//	public String getGender() {
//		return this.gender;
//	}
//	public void setGender(String gender) {
//		this.gender = gender;
//	}
//	public String getOrgin() {
//		return this.orgin;
//	}
//	public void setOrgin(String orgin) {
//		this.orgin = orgin;
//	}
//	public String getDestination() {
//		return this.Destination;
//	}
//	public void setDestination(String destination) {
//		this.Destination = destination;
//	}
//	public int getTrainnumber() {
//		return this.Trainnumber;
//	}
//	public void setTrainnumber(int trainnumber) {
//		this.Trainnumber = trainnumber;
//	}
//	public int getTicketprice() {
//		return this.Ticketprice;
//	}
//	public void setTicketprice(int ticketprice) {
//		this.Ticketprice = ticketprice;
//	}
//
//	
//	
//
//	
//	
//	
//	
//}
