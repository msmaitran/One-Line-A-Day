package com.msmaitran.onelineaday.services;

import com.msmaitran.onelineaday.models.Entry;

import java.util.List;

public interface EntryService {

//    List<Entry> findAll();

    List<Entry> getUserEntries(String username);

    List<Entry> findEntryByDateContaining(String entrydate, String username);

    Entry findEntryById(long entryid, String username);

//    Entry save(Entry entry, long userid);

    Entry save(Entry entry, String username);

    Entry update(Entry entry, String username, long entryid);

    void delete(String username, long entryid);
}
