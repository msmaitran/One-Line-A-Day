package com.msmaitran.onelineaday.services;

import com.msmaitran.onelineaday.exceptions.ResourceNotFoundException;
import com.msmaitran.onelineaday.exceptions.UnauthorizedUserException;
import com.msmaitran.onelineaday.logging.Loggable;
import com.msmaitran.onelineaday.models.Entry;
import com.msmaitran.onelineaday.models.User;
import com.msmaitran.onelineaday.repository.EntryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Loggable
@Transactional
@Service(value = "entryService")
public class EntryServiceImpl implements EntryService {

    @Autowired
    private EntryRepository entryrepos;

    @Autowired
    private UserService userService;

/*    @Override
    public List<Entry> findAll() {
        List<Entry> list = new ArrayList<>();
        entryrepos.findAll().iterator().forEachRemaining(list::add);
        return list;
    }*/

    @Override
    public List<Entry> getUserEntries(String username) {
        User user = userService.findByName(username);
        return user.getEntries();
    }

    @Override
    public List<Entry> findEntryByDateContaining(String entrydate, String username) {
        User user = userService.findByName(username);
        return entryrepos.findByEntrydateContaining(entrydate);
    }

    @Override
    public Entry findEntryById(long entryid, String username) {
        Entry entry = entryrepos.findById(entryid).orElseThrow(() ->
                new ResourceNotFoundException("Entry " + entryid + " not found!"));
        if (entry.getUser().getUsername().equals(username)) {
            return entry;
        } else {
            throw new UnauthorizedUserException("User does not have access to entry!");
        }
    }

    @Override
    public Entry save(Entry entry, String username) {
        Entry addEntry = new Entry();
        addEntry.setDescription(entry.getDescription());
        addEntry.setEntrydate(entry.getEntrydate());
        addEntry.setPhotoUrl(entry.getPhotoUrl());
        if (userService.findByName(username) != null) {
            addEntry.setUser(userService.findByName(username));
        } else {
            throw new ResourceNotFoundException("Invalid Username");
        }
        return entryrepos.save(addEntry);
    }

    @Override
    public Entry update(Entry entry, String username, long entryid) {
        Entry currentEntry = entryrepos.findByEntryid(entryid);
        if (currentEntry.getUser().getUsername().equals(username)) {
            if (entry.getDescription() != null) {
                currentEntry.setDescription(entry.getDescription());
            }
            if (entry.getEntrydate() != null) {
                currentEntry.setEntrydate(entry.getEntrydate());
            }
            if (entry.getPhotoUrl() != null) {
                currentEntry.setPhotoUrl(entry.getPhotoUrl());
            }
            return entryrepos.save(currentEntry);
        } else {
            throw new UnauthorizedUserException("User does not have permission!");
        }
    }

    @Override
    public void delete(String username, long entryid) {
        Entry currentEntry = entryrepos.findByEntryid(entryid);
        if (currentEntry.getUser().getUsername().equals(username)) {
            if (entryrepos.findById(entryid).isPresent()) {
                entryrepos.deleteById(entryid);
            } else {
                throw new ResourceNotFoundException(Long.toString(entryid));
            }
        } else {
            throw new UnauthorizedUserException("User does not have permission!");
        }
    }
}
