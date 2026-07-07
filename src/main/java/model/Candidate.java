package model;

public class Candidate {
    int id,votes;
    String name,party;


    public Candidate(int id, String name, String party, int votes) {
        this.votes = votes;
        this.name = name;
        this.party = party;
        this.id =id;
    }

    public Candidate(String name, String party, int votes) {
        this.name = name;
        this.party = party;
        this.votes =votes;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getVotes() {
        return votes;
    }

    public void setVotes(int votes) {
        this.votes = votes;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getParty() {
        return party;
    }

    public void setParty(String party) {
        this.party = party;
    }
}
