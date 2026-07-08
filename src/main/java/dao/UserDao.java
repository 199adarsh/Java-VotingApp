package dao;


import model.User;
import util.DbConnection;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {


    public User login(String email, String password) throws Exception {

        Connection connect = DbConnection.getConnection();
        String sql = "SELECT * FROM users WHERE email=? AND password=?";
        PreparedStatement pStatement = connect.prepareStatement(sql);

        pStatement.setString(1, email);
        pStatement.setString(2, password);

        ResultSet rs = pStatement.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setfName(rs.getString("first_name"));
                user.setRole(rs.getString("role"));
                user.setEmail(rs.getString("email"));
                user.setvStatus(rs.getBoolean("status")); // set other fields return user;

                return user;

            } return null;

        }

        public boolean register (User user) throws Exception {

            Connection connect = DbConnection.getConnection();

            String sql = "INSERT INTO users(first_name, last_name, email, password, dob, role, status) VALUES (?, ?, " +
                    "?, ?, ?, ?, ?)";

            PreparedStatement pStatement = connect.prepareStatement(sql);

            pStatement.setString(1, user.getfName());
            pStatement.setString(2, user.getlName());
            pStatement.setString(3, user.getEmail());
            pStatement.setString(4, user.getPassword());
            pStatement.setDate(5, (Date) user.getDob());
            pStatement.setString(6, "voter");
            pStatement.setBoolean(7, true);

            int i = pStatement.executeUpdate();
            if (i > 0) {
                System.out.println("Data Inserted");
                return true;
            }


            return false;
        }


        String findEmail (String email) throws Exception {

            Connection connect = DbConnection.getConnection();
            String sql = "SELECT * FROM users WHERE email=?";
            PreparedStatement pStatement = connect.prepareStatement(sql);

            pStatement.setString(1, email);
            ResultSet rSet = pStatement.executeQuery();

            if (rSet.next()) {
                System.out.println("User Exist" + rSet.getString(4));
                rSet.beforeFirst();
                return rSet.getString(4);
            }

            return "Email Not Exist";
        }

        public int updateStatus ( int id) throws Exception {

            Connection connect = DbConnection.getConnection();
            String sql = "UPDATE users SET status = false WHERE id = ?;";
            PreparedStatement pStatement = connect.prepareStatement(sql);

            pStatement.setInt(1, id);
            int i =  pStatement.executeUpdate();
            if (i > 0) System.out.println("Table Updated");

           return i;
        }

        ResultSet getVoters () throws Exception {
            Connection connect = DbConnection.getConnection();
            String sql = "SELECT first_name,last_name,id FROM users";

            PreparedStatement pStatement = connect.prepareStatement(sql);
            ResultSet rSet = pStatement.executeQuery();

            return rSet;
        }

    }

