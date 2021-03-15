package com.msmaitran.onelineaday.models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "entries")
@JsonIgnoreProperties(value = {"user"})
public class Entry {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long entryid;

    @Column(nullable = false)
    private String description;

    @Column(nullable = false)
    private String entrydate;

    private String photoUrl;

    @ManyToOne
    @JoinColumn(name = "userid",
                nullable = false)
    @JsonIgnoreProperties("entries")
    private User user;

    public Entry() {
    }

    public Entry(String description, String entrydate, String photoUrl, User user) {
        this.description = description;
        this.entrydate = entrydate;
        this.photoUrl = photoUrl;
        this.user = user;
    }

    public long getEntryid() {
        return entryid;
    }

    public void setEntryid(long entryid) {
        this.entryid = entryid;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getEntrydate() {
        return entrydate;
    }

    public void setEntrydate(String entrydate) {
        this.entrydate = entrydate;
    }

    public String getPhotoUrl() {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl) {
        this.photoUrl = photoUrl;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
