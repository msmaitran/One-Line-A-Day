package com.msmaitran.onelineaday.controllers;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.msmaitran.onelineaday.models.*;
import com.msmaitran.onelineaday.services.EntryService;
import com.msmaitran.onelineaday.services.RoleService;
import com.msmaitran.onelineaday.services.UserService;
import io.restassured.module.mockmvc.RestAssuredMockMvc;
import org.junit.After;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

// Comment out @Transactional & @Component in SeedData
@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@AutoConfigureMockMvc
@WithMockUser(username = "admin",
        roles = {"USER", "ADMIN"})
@FixMethodOrder(value = MethodSorters.NAME_ASCENDING)
public class EntryControllerUnitTest {

    @Autowired
    private WebApplicationContext webApplicationContext;

    private MockMvc mockMvc;

    @MockBean
    private EntryService entryService;

    @MockBean
    private RoleService roleService;

    @MockBean
    private UserService userService;

    private User user;
    private List<Entry> entryList = new ArrayList<>();

    @Before
    public void setUp() throws Exception {
        Role r1 = new Role("admin");
        Role r2 = new Role("user");
        Role r3 = new Role("data");

        roleService.save(r1);
        roleService.save(r2);
        roleService.save(r3);

        // admin, data, user
        ArrayList<UserRoles> admins = new ArrayList<>();
        admins.add(new UserRoles(new User(),
                r1));
        admins.add(new UserRoles(new User(),
                r2));
        admins.add(new UserRoles(new User(),
                r3));
        user = new User("admin",
                "ILuvM4th!",
                "admin@lambdaschool.local",
                admins);
        user.getUseremails()
                .add(new Useremail(user,
                        "admin@email.local"));
        user.getUseremails()
                .add(new Useremail(user,
                        "admin@mymail.local"));
        user = userService.save(user);

        String description1 = "Test Entry 1";
        String entrydate1 = "11-20-2019";
        String url1 = "url";
        Entry entry1 = new Entry(description1, entrydate1, url1, user);
        entry1.setEntryid(1);
        System.out.println(entry1.getEntryid());

        entryService.save(entry1, "admin");
        user = userService.save(user);

        RestAssuredMockMvc.webAppContextSetup(webApplicationContext);
        mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext)
                .apply(SecurityMockMvcConfigurers.springSecurity())
                .build();
    }

    @After
    public void tearDown() throws Exception {
    }

    @Test
    public void A_getEntriesByUser() throws Exception {
        String apiUrl = "/entries/entries";

        Mockito.when(entryService.getUserEntries("admin")).thenReturn(entryList);

        RequestBuilder rb = MockMvcRequestBuilders.get(apiUrl).accept(MediaType.APPLICATION_JSON);
        MvcResult r = mockMvc.perform(rb).andReturn();
        String tr = r.getResponse().getContentAsString();

        ObjectMapper mapper = new ObjectMapper();
        String er = mapper.writeValueAsString(entryList);

        System.out.println("Expect: " + er);
        System.out.println("Actual: " + tr);

        assertEquals("Rest API Returns List", er, tr);
    }

    @Test
    public void B_findEntryById() throws Exception {


        Mockito.when(entryService.findEntryById(1, "admin")).thenReturn(entryList.get(0));

        String apiUrl = "/entries/entry/1";

        RequestBuilder rb = MockMvcRequestBuilders.get(apiUrl).accept(MediaType.APPLICATION_JSON);
        MvcResult r = mockMvc.perform(rb).andReturn();
        String tr = r.getResponse().getContentAsString();

        ObjectMapper mapper = new ObjectMapper();
        String er = mapper.writeValueAsString(entryList.get(0));

        System.out.println("Expect: " + er);
        System.out.println("Actual: " + tr);

        assertEquals("Rest API Returns List", er, tr);
    }

    @Test
    public void C_addEntry() throws Exception {
        String apiUrl = "/entries/entry";

        Entry newEntry = new Entry("Testing 123", "11-21-2019", "url", user);

        Mockito.when(entryService.save(newEntry, "testdog")).thenReturn(newEntry);

        ObjectMapper mapper = new ObjectMapper();
        String er = mapper.writeValueAsString(newEntry);

        RequestBuilder rb = MockMvcRequestBuilders.post(apiUrl)
                .accept(MediaType.APPLICATION_JSON)
                .contentType(MediaType.APPLICATION_JSON)
                .content(er);

        mockMvc.perform(rb).andExpect(status().isCreated()).andDo(MockMvcResultHandlers.print());
    }

    @Test
    public void D_updateEntry() throws Exception {
        String apiUrl = "/entries/entry/1";

        Entry currentEntry = new Entry();
        currentEntry.setDescription("Test Entry");
        Entry updateEntry = entryList.get(0);
        updateEntry.setDescription("Test Entry");

        Mockito.when(entryService.update(currentEntry, "admin", 1)).thenReturn(updateEntry);

        ObjectMapper mapper = new ObjectMapper();
        String er = mapper.writeValueAsString(currentEntry);

        RequestBuilder rb = MockMvcRequestBuilders.put(apiUrl)
                .accept(MediaType.APPLICATION_JSON)
                .contentType(MediaType.APPLICATION_JSON)
                .content(er);
        mockMvc.perform(rb).andExpect(status().isCreated()).andDo(MockMvcResultHandlers.print());
    }

    @Test
    public void E_deleteEntryById() throws Exception {
        String apiUrl = "/entries/entry/7";

        RequestBuilder rb = MockMvcRequestBuilders.delete(apiUrl)
                .contentType(MediaType.APPLICATION_JSON);

        mockMvc.perform(rb).andExpect(status().isOk()).andDo(MockMvcResultHandlers.print());
    }
}
