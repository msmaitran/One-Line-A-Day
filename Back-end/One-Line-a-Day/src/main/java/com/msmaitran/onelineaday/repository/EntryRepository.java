package com.msmaitran.onelineaday.repository;

import com.msmaitran.onelineaday.models.Entry;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface EntryRepository extends CrudRepository<Entry, Long> {

    List<Entry> findByEntrydateContaining(String entrydate);

    Entry findByEntryid(long entryid);
}
