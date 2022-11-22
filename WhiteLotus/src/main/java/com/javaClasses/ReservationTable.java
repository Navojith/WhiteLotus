package com.javaClasses;

public class ReservationTable {
    private int resID;
    private int roomID;
    private int userID;
    private String packageID;
    private int stayLenght;


    public ReservationTable() {}


    public ReservationTable(int resID, int roomID, int userID, String packageID, int stayLenght) {
        this.resID = resID;
        this.roomID = roomID;
        this.userID = userID;
        this.packageID = packageID;
        this.stayLenght = stayLenght;
    }


    public int getResID() {
        return resID;
    }


    public void setResID(int resID) {
        this.resID = resID;
    }


    public int getRoomID() {
        return roomID;
    }


    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }


    public int getUserID() {
        return userID;
    }


    public void setUserID(int userID) {
        this.userID = userID;
    }


    public String getPackageID() {
        return packageID;
    }


    public void setPackageID(String packageID) {
        this.packageID = packageID;
    }


    public int getStayLenght() {
        return stayLenght;
    }


    public void setStayLenght(int stayLenght) {
        this.stayLenght = stayLenght;
    }

    
}
