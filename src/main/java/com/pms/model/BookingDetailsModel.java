package com.pms.model;

import java.util.ArrayList;
import java.util.Random;

public class BookingDetailsModel
{
	private static final ArrayList<Long> usedpnrs1 = new ArrayList<>();
	private static final Random random1 = new Random();
	public static long generateUniquepnrs1()
	{
		long pnr;
		do {
			pnr = 6000000000L +(long)(random1.nextDouble()*9000000000L);
			
		}while(usedpnrs1.contains(pnr));
		usedpnrs1.add(pnr);
		return pnr;
	}
	
	
	
	
	
	
	String gmailid;
	long pnr;
	String name ;
	int age;
	String gender;
    int	trainnumber;
	String trainname;
	String origin;
	String destination;
	int ticketPrice;
	
	
	public BookingDetailsModel(String gmailid, String name, int age, String gender, int trainnumber, String trainname,
			String origin, String destination, int ticketPrice) {
		super();
		this.pnr = generateUniquepnrs1() ;
		this.gmailid = gmailid;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.trainnumber = trainnumber;
		this.trainname = trainname;
		this.origin = origin;
		this.destination = destination;
		this.ticketPrice = ticketPrice;
	}
	 
	public String getGmailid() {
		return gmailid;
	}
	
	public long getPnr() {
		return pnr;
	}

	public void setGmailid(String gmailid) {
		this.gmailid = gmailid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public int getTrainnumber() {
		return trainnumber;
	}

	public void setTrainnumber(int trainnumber) {
		this.trainnumber = trainnumber;
	}

	public String getTrainname() {
		return trainname;
	}

	public void setTrainname(String trainname) {
		this.trainname = trainname;
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

	public int getTicketPrice() {
		return ticketPrice;
	}

	public void setTicketPrice(int ticketPrice) {
		this.ticketPrice = ticketPrice;
	}


	
	
	
	
	
}


