package com.msmaitran.onelineaday;

import com.github.javafaker.Faker;
import com.github.javafaker.service.FakeValuesService;
import com.github.javafaker.service.RandomService;
import com.msmaitran.onelineaday.models.Role;
import com.msmaitran.onelineaday.models.User;
import com.msmaitran.onelineaday.models.UserRoles;
import com.msmaitran.onelineaday.models.Useremail;
import com.msmaitran.onelineaday.services.RoleService;
import com.msmaitran.onelineaday.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Locale;

//@Transactional
//@Component
public class SeedData implements CommandLineRunner {

    @Autowired
    RoleService roleService;

    @Autowired
    UserService userService;


    @Override
    public void run(String[] args) throws Exception {
        Role r1 = new Role("admin");
        Role r2 = new Role("user");
        Role r3 = new Role("data");

        r1 = roleService.save(r1);
        r2 = roleService.save(r2);
        r3 = roleService.save(r3);

        // admin, data, user
        ArrayList<UserRoles> admins = new ArrayList<>();
        admins.add(new UserRoles(new User(),
                r1));
        admins.add(new UserRoles(new User(),
                r2));
        admins.add(new UserRoles(new User(),
                r3));
        User u1 = new User("admin",
                "password",
                "admin@lambdaschool.local",
                admins);
        u1.getUseremails()
                .add(new Useremail(u1,
                        "admin@email.local"));
        u1.getUseremails()
                .add(new Useremail(u1,
                        "admin@mymail.local"));

        userService.save(u1);

        // data, user
        ArrayList<UserRoles> datas = new ArrayList<>();
        datas.add(new UserRoles(new User(),
                r3));
        datas.add(new UserRoles(new User(),
                r2));
        User u2 = new User("data",
                "1234567",
                "data@lambdaschool.local",
                datas);
        u2.getUseremails()
                .add(new Useremail(u2,
                        "data@mymail.local"));
        u2.getUseremails()
                .add(new Useremail(u2,
                        "data@gmail.local"));
        u2.getUseremails()
                .add(new Useremail(u2,
                        "data@email.local"));
        userService.save(u2);

        // user
        ArrayList<UserRoles> users = new ArrayList<>();
        users.add(new UserRoles(new User(),
                r2));
        User u3 = new User("user1",
                "PassWord",
                "user1@lambdaschool.local",
                users);
        u3.getUseremails()
                .add(new Useremail(u3,
                        "user1@email.local"));
        userService.save(u3);

        users = new ArrayList<>();
        users.add(new UserRoles(new User(),
                r2));
        User u4 = new User("user2",
                "password",
                "user2@school.lambda",
                users);
        userService.save(u4);

        users = new ArrayList<>();
        users.add(new UserRoles(new User(),
                r2));
        User u5 = new User("user3",
                "password",
                "user3@school.lambda",
                users);
        userService.save(u5);

        // using JavaFaker create a bunch of regular users
        // https://www.baeldung.com/java-faker
        // https://www.baeldung.com/regular-expressions-java

       /* FakeValuesService fakeValuesService = new FakeValuesService(new Locale("en-US"),
                new RandomService());
        Faker nameFaker = new Faker(new Locale("en-US"));

        for (int i = 0; i < 100; i++) {
            new User();
            User fakeUser;

            users = new ArrayList<>();
            users.add(new UserRoles(new User(),
                    r2));
            fakeUser = new User(nameFaker.name()
                    .username(),
                    "password",
                    nameFaker.internet()
                            .emailAddress(),
                    users);
            fakeUser.getUseremails()
                    .add(new Useremail(fakeUser,
                            fakeValuesService.bothify("????##@gmail.com")));
            userService.save(fakeUser);
        }*/
    }
}
