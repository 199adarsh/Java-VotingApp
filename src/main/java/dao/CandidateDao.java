package dao;

import model.Candidate;
import util.DbConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CandidateDao {

    public List<Candidate> getCandidates() throws Exception {

        Connection connect = DbConnection.getConnection();
        String sql = "SELECT * FROM candidates ORDER BY votes DESC";

        PreparedStatement pStatement = connect.prepareStatement(sql);
        ResultSet rSet = pStatement.executeQuery();

        List<Candidate> candidates = new ArrayList<>();

        while (rSet.next()) {

            Candidate candidate = new Candidate(

                    rSet.getInt("id"),
                    rSet.getString("name"),
                    rSet.getString("party"),
                    rSet.getInt("votes")
            );

            candidates.add(candidate);
        }

        return candidates;
    }

    public Candidate getCandidateById(int id) throws Exception {

        Connection connect = DbConnection.getConnection();
        String sql = "SELECT * FROM candidates WHERE id = ?";

        PreparedStatement pStatement = connect.prepareStatement(sql);
        pStatement.setInt(1, id);

        ResultSet rSet = pStatement.executeQuery();

        if (rSet.next()) {
            Candidate candidate = new Candidate(
                    rSet.getInt("id"),
                    rSet.getString("name"),
                    rSet.getString("party"),
                    rSet.getInt("votes")
            );

            return candidate;
        }

        return null; // Candidate not found
    }

    public int vote(int id) throws Exception {
        Connection connect = DbConnection.getConnection();
        String sql = "UPDATE candidates SET votes = votes+1 WHERE id = ? ;";
        PreparedStatement pStatement = connect.prepareStatement(sql);

        pStatement.setInt(1, id);
        int i = pStatement.executeUpdate();


        return i;

    }

    public boolean addCandidate(Candidate candidate) throws Exception {

        Connection connect = DbConnection.getConnection();
        String sql="INSERT INTO candidates(name,party,votes) VALUES(?,?,0)";
        PreparedStatement pStatement = connect.prepareStatement(sql);


        pStatement.setString(1, candidate.getName());
        pStatement.setString(2, candidate.getParty());

        int i = pStatement.executeUpdate();
        if (i>0){
            System.out.println("Data Inserted");
            return true;
        }

        return false;
    }
    public boolean deleteCandidate(int id) throws Exception {

        Connection connect = DbConnection.getConnection();
        String sql="DELETE FROM candidates WHERE id = ?";
        PreparedStatement pStatement = connect.prepareStatement(sql);

        pStatement.setInt(1,id);


        int i = pStatement.executeUpdate();
        if (i>0){
            System.out.println("Candidate Deleted");
            return true;
        }

        return false;
    }

    public boolean updateCandidate(int id, Candidate candidate) throws Exception {

        Connection connect = DbConnection.getConnection();
        String sql = "UPDATE candidates SET name = ?, party = ?, votes = ? WHERE id = ?";
        PreparedStatement pStatement = connect.prepareStatement(sql);

        pStatement.setString(1, candidate.getName());
        pStatement.setString(2, candidate.getParty());
        pStatement.setInt(3, candidate.getVotes());
        pStatement.setInt(4, id);

        int i = pStatement.executeUpdate();
        if (i > 0) {
            System.out.println("Data Updated");
            return true;
        }

        return false;
    }





}
/*
getAllCandidates()
vote(int candidateId)
getResults()
addCandidate(Candidate c)
deleteCandidate(int id)
*/

