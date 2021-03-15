package com.msmaitran.onelineaday;

import com.github.javafaker.Faker;
import com.github.javafaker.service.FakeValuesService;
import com.github.javafaker.service.RandomService;
import com.msmaitran.onelineaday.models.*;
import com.msmaitran.onelineaday.services.EntryService;
import com.msmaitran.onelineaday.services.RoleService;
import com.msmaitran.onelineaday.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Locale;

@Transactional
@Component
public class SeedData implements CommandLineRunner
{
    @Autowired
    RoleService roleService;

    @Autowired
    UserService userService;

    @Autowired
    EntryService entryService;

    @Override
    public void run(String[] args) throws Exception
    {
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
        User u1 = new User("admin",
                "ILuvM4th!",
                "admin@lambdaschool.local",
                admins);
        u1.getUseremails()
                .add(new Useremail(u1,
                        "admin@email.local"));
        u1.getUseremails()
                .add(new Useremail(u1,
                        "admin@mymail.local"));
        u1 = userService.save(u1);
        String description1 = "Test Entry 1";
        String entrydate1 = "11-20-2019";
        String url1 = "url";
        Entry entry1 = new Entry(description1, entrydate1, url1, u1);
        entryService.save(entry1, u1.getUsername());
        System.out.println("Entry: " + description1 + ", Date: " + entrydate1 + ", Entry ID:" + entry1.getEntryid());

        // data, user
        ArrayList<UserRoles> datas = new ArrayList<>();
        datas.add(new UserRoles(new User(),
                r3));
        datas.add(new UserRoles(new User(),
                r2));
        User u2 = new User("cinnamon",
                "1234567",
                "cinnamon@lambdaschool.local",
                datas);
        u2.getUseremails()
                .add(new Useremail(u2,
                        "cinnamon@mymail.local"));
        u2.getUseremails()
                .add(new Useremail(u2,
                        "hops@mymail.local"));
        u2.getUseremails()
                .add(new Useremail(u2,
                        "bunny@email.local"));
        u2 = userService.save(u2);
        String description2 = "Test Entry 2";
        String entrydate2 = "11-20-2019";
        String url2 = "url";
        Entry entry2 = new Entry(description2, entrydate2, url2, u2);
        entryService.save(entry2, u2.getUsername());
        System.out.println("Entry: " + description2 + ", Date: " + entrydate2 + ", Entry ID:" + entry2.getEntryid());

        // user
        ArrayList<UserRoles> users = new ArrayList<>();
        users.add(new UserRoles(new User(),
                r1));
        User u3 = new User("testbarn",
                "ILuvM4th!",
                "testbarn@school.lambda",
                users);
        u3.getUseremails()
                .add(new Useremail(u3,
                        "barnbarn@email.local"));
        u3 = userService.save(u3);
        String description3 = "Test Entry 3";
        String entrydate3 = "11-20-2019";
        String url3 = "url";
        Entry entry3 = new Entry(description3, entrydate3, url3, u3);
        entryService.save(entry3, u3.getUsername());
        System.out.println("Entry: " + description3 + ", Date: " + entrydate3 + ", Entry ID:" + entry3.getEntryid());

        users = new ArrayList<>();
        users.add(new UserRoles(new User(),
                r2));
        User u4 = new User("testcat",
                "password",
                "testcat@school.lambda",
                users);
        u4 = userService.save(u4);
        String description4 = "Test Entry 4";
        String entrydate4 = "11-20-2019";
        String url4 = "url";
        Entry entry4 = new Entry(description4, entrydate4, url4, u4);
        entryService.save(entry4, u4.getUsername());
        System.out.println("Entry: " + description4 + ", Date: " + entrydate4 + ", Entry ID:" + entry4.getEntryid());

        users = new ArrayList<>();
        users.add(new UserRoles(new User(),
                r2));
        User u5 = new User("testdog",
                "password",
                "testdog@school.lambda",
                users);
        u5 = userService.save(u5);
        String description5 = "Test Entry 5";
        String entrydate5 = "11-20-2019";
        String url5 = "url";
        Entry entry5 = new Entry(description5, entrydate5, url5, u5);
        entryService.save(entry5, u5.getUsername());
        System.out.println("Entry: " + description5 + ", Date: " + entrydate5 + ", Entry ID:" + entry5.getEntryid());

        System.out.println("\n*** Seed Data ***");
        System.out.println(u1);
        System.out.println(u2);
        System.out.println(u3);
        System.out.println(u4);
        System.out.println(u5);
        System.out.println("*** Seed Data ***\n");
    }
}
