package com.dbConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.dbConnect.dbConnect;
import com.javaClasses.Reservation;
import com.javaClasses.ReservationTable;


public class ReservationDBUtil {
    private static Connection con;


    // select package details for a dynamic dropdown menu
    public ArrayList<Reservation> getPkgs() throws SQLException{
        con = dbConnect.getConnection();
        ArrayList<Reservation> packages = new ArrayList<>();
        
        try {
            String sql = "select id, name from packages";
            Statement statement = con.createStatement();
            ResultSet result = statement.executeQuery(sql);

            while (result.next()) {
                Reservation reservation = new Reservation();
                reservation.setPkgID(result.getString("id"));
                reservation.setPkgType(result.getString("name"));
                packages.add(reservation);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        con.close();
        return packages;
    }

    // to display reservation table
    public ArrayList<ReservationTable> getResTable() throws SQLException{
        con = dbConnect.getConnection();
        ArrayList<ReservationTable> resTableList = new ArrayList<>();

        try {
            String sql = "select * from reservations";
            Statement statement = con.createStatement();
            ResultSet result = statement.executeQuery(sql);

            while (result.next()) {
                ReservationTable resTable = new ReservationTable(result.getInt(1), result.getInt(2), result.getInt(3),
                                                                 result.getString(4), result.getInt(5));
                
                resTableList.add(resTable);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        con.close();
        return resTableList;
    }



    // insert data into database
    public boolean reserve(String userName, String pkgID, int stayLenght) {
        
        boolean isSuccess = false;

        try {
        	con = dbConnect.getConnection();
        	Statement ps1 = con.createStatement();
        	
            // get user id from user name
            String sqlGetUserID = "select ID from users where username like '"+userName+"'";
            ResultSet result = ps1.executeQuery(sqlGetUserID);
            int userID = 0;
            while(result.next()) {
            	userID = result.getInt("ID");
            }
            
            System.out.println("test");
            System.out.println(userID);
            
            // find an available room
            String findRoom = "select r.id from rooms r where not r.id = any (select res.roomID from reservations res)";
            Statement ps2 = con.createStatement();
            ResultSet rs = ps2.executeQuery(findRoom);
            int roomID = 0;
            while(rs.next()){
                roomID = rs.getInt("id");
            }
            System.out.println(roomID);
            
            // insert data
            String sql = "insert into reservations(roomID, userID, packageID, stayLength) values ('"+roomID+"','"+userID+"','"+pkgID+"','"+stayLenght+"')";
            Statement ps3 = con.createStatement();
            int end = ps3.executeUpdate(sql);
            
            if (end > 0) {
                isSuccess = true;
            }
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("error");
        }
        return isSuccess;
    }


    // check room availability
    public boolean checkAvailablity() {
        con = dbConnect.getConnection();
        boolean result = false;

        try {
            String findRoom = "select r.id from rooms r where not r.id = any (select res.roomID from reservations res)";
            Statement ps = con.createStatement();
            ResultSet rs = ps.executeQuery(findRoom);

            if (rs.next()) {
                result = true;
            } else {
                result = false;
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }


    // update phone number
    public boolean updatePhNumber(String userName, String phNumber) {
        con = dbConnect.getConnection();
        boolean isSuccess = false;

        try {
            String updatePhNum = "update users set contactNumber = '"+phNumber+"' where username like '"+userName+"'";
            Statement statement = con.createStatement();
            int result = statement.executeUpdate(updatePhNum);

            if (result > 0) {
                isSuccess = true;
            }
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }


    // delete reservation
    public boolean deleteReservation(int resID) {
        con = dbConnect.getConnection();

        boolean isSuccess = false;
         try {
            String deleteRes = "delete from reservations where id = "+resID+"";
            Statement statement = con.createStatement();
            int result = statement.executeUpdate(deleteRes);

            if (result > 0) {
                isSuccess = true;
            }
            con.close();

         } catch (Exception e) {
            e.printStackTrace();
         }
         return isSuccess;
    }
}
