package com.pms.model;

public class GetPassengerDetailsModel {
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
	public void setPnr(long pnr) {
		this.pnr = pnr;
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
	public GetPassengerDetailsModel(long pnr, String passengerName, int age, String gender, int trainNumber,
			String origin, String destination, int price) {
		super();
		this.pnr = pnr;
		this.passengerName = passengerName;
		this.age = age;
		this.gender = gender;
		this.trainNumber = trainNumber;
		this.origin = origin;
		this.destination = destination;
		this.price = price;
	}
    
    
}
