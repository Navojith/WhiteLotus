package com.javaClasses;

public class Reservation {
    private String userName;
    private String pNumber;
    private String pkgID;
    private String pkgType;
    private String promocode;
    private int stayLenght;
    private int resID;

    public Reservation() {}

    public Reservation(String userName, String pNumber, String pkgID, String pkgType, int stayLenght) {
        this.userName = userName;
        this.pNumber = pNumber;
        this.pkgID = pkgID;
        this.pkgType = pkgType;
        this.stayLenght = stayLenght;
    }

    public Reservation(int resID) {
        this.resID = resID;
    }


    public String getUserName() {
        return userName;
    }


    public void setUserName(String userName) {
        this.userName = userName;
    }


    public String getpNumber() {
        return pNumber;
    }


    public void setpNumber(String pNumber) {
        this.pNumber = pNumber;
    }


    public String getPkgID() {
        return pkgID;
    }


    public void setPkgID(String pkgID) {
        this.pkgID = pkgID;
    }


    public String getPkgType() {
        return pkgType;
    }


    public void setPkgType(String pkgType) {
        this.pkgType = pkgType;
    }


    public String getPromocode() {
        return promocode;
    }


    public void setPromocode(String promocode) {
        this.promocode = promocode;
    }


    public int getStayLenght() {
        return stayLenght;
    }


    public void setStayLenght(int stayLenght) {
        this.stayLenght = stayLenght;
    }


    public int getResID() {
        return resID;
    }


    public void setResID(int resID) {
        this.resID = resID;
    }


    
}
