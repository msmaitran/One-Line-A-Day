package com.msmaitran.onelineaday.services;

import com.msmaitran.onelineaday.OneLineADayApplication;
import com.msmaitran.onelineaday.exceptions.UnauthorizedUserException;
import com.msmaitran.onelineaday.models.Entry;
import org.junit.After;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.mockito.MockitoAnnotations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = OneLineADayApplication.class)
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class EntryServiceImplUnitTest {

    @Autowired
    private EntryService entryService;

    @Before
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
    }

    @After
    public void tearDown() throws Exception {

    }

    @Test
    public void A_getUserEntries() {
        assertEquals(1,
                     entryService.getUserEntries("testdog").size());
        System.out.println(entryService.getUserEntries("testdog").get(0).getEntryid());

        assertEquals(1,
                entryService.getUserEntries("testcat").size());
        System.out.println(entryService.getUserEntries("testcat").get(0).getEntryid());
    }

    @Test
    public void B_findEntryById() {
        assertEquals("Test Entry 5",
                     entryService.findEntryById(19, "testdog").getDescription());
    }

    @Test(expected = UnauthorizedUserException.class)
    public void B_findEntryByUnauthorizedUser() {
        assertEquals("Test Entry 4",
                     entryService.findEntryById(17, "testdog").getDescription());
    }

    @Test
    public void C_addEntry() {
        Entry newEntry = new Entry("Testing",
                "11-20-2019",
                "url",
                entryService.getUserEntries("testdog").get(0).getUser());
        entryService.save(newEntry, "testdog");
        assertEquals(2,
                     entryService.getUserEntries("testdog").size());
    }

    @Test
    public void D_updateEntry() {
        Entry currentEntry = new Entry();
        currentEntry.setDescription("Testing 123");
        currentEntry.setEntrydate("11-21-2019");
        currentEntry.setPhotoUrl("none");
        String username = "testdog";
        assertEquals("Testing 123",
                     entryService.update(currentEntry, username, 19).getDescription());
    }

    @Test (expected = UnauthorizedUserException.class)
    public void D_updateEntryByUnauthorizedUser() {
        Entry currentEntry = new Entry();
        assertEquals("Test Entry 4",
                     entryService.update(currentEntry, "testdog", 17).getDescription());
    }

    @Test
    public void E_deleteEntry() {
        entryService.delete("testdog", 19);
        assertEquals(1, entryService.getUserEntries("testdog").size());
    }

    @Test (expected = UnauthorizedUserException.class)
    public void E_deleteEntryByUnauthorizedUser() {
        entryService.delete("testdog", 17);
    }
}
