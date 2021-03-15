package com.msmaitran.onelineaday.controllers;

import com.msmaitran.onelineaday.logging.Loggable;
import com.msmaitran.onelineaday.models.Entry;
import com.msmaitran.onelineaday.models.ErrorDetail;
import com.msmaitran.onelineaday.services.EntryService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.net.URI;
import java.util.Collections;
import java.util.List;

@Loggable
@RestController
@Api(tags = {"EntryEndpoints"})
@RequestMapping(value = "/entries")
public class EntryController {

    private static final Logger logger = LoggerFactory.getLogger(EntryController.class);

    @Autowired
    private EntryService entryService;

/*    @GetMapping(value = "/allentries",
                produces = {"application/json"})
    public ResponseEntity<?> listAllEntries(HttpServletRequest request) {
        logger.info(request.getMethod().toUpperCase() + " " + request.getRequestURI() + " accessed");
        List<Entry> myEntries = entryService.findAll();
        return new ResponseEntity<>(myEntries, HttpStatus.OK);
    }*/

    @ApiOperation(value = "Returns all entries created by the user",
                  response = Entry.class,
                  responseContainer = "List")
    @GetMapping(value = "/entries",
                produces = {"application/json"})
    public ResponseEntity<?> getEntriesByUser(Authentication authentication) {
        return new ResponseEntity<>(entryService.getUserEntries(authentication.getName()), HttpStatus.OK);
    }

    @GetMapping(value = "/entry/datecontaining/{entrydate}",
                produces = {"application/json"})
    public ResponseEntity<?> getEntryByDateContaining(@PathVariable String entrydate, Authentication authentication) {
        return new ResponseEntity<>(entryService.findEntryByDateContaining(entrydate, authentication.getName()), HttpStatus.OK);
    }

    @ApiOperation(value = "User finds entry by ID")
    @GetMapping(value = "/entry/{entryid}",
                produces = {"application/json"})
    public ResponseEntity<?> findEntryById(@PathVariable long entryid, Authentication authentication) {
        Entry myEntry = entryService.findEntryById(entryid, authentication.getName());
        return new ResponseEntity<>(myEntry, HttpStatus.OK);
    }

/*    @PostMapping(value = "/entry/{userid}",
                 consumes = {"application/json"})
    public ResponseEntity<?> addEntry(@Valid
                                      @RequestBody Entry newEntry,
                                      @PathVariable long userid) {
        newEntry = entryService.save(newEntry, userid);
        HttpHeaders responseHeaders = new HttpHeaders();
        URI newEntryURI = ServletUriComponentsBuilder
                .fromCurrentRequest()
                .path("/{entryid}")
                .buildAndExpand(newEntry.getEntryid())
                .toUri();
        responseHeaders.setLocation(newEntryURI);
        return new ResponseEntity<>(null, responseHeaders, HttpStatus.CREATED);
    }*/

    @ApiOperation(value = "User creates entry")
    @PostMapping(value = "/entry",
                consumes = {"application/json"})
    public ResponseEntity<?> addEntry(@Valid
                                      @RequestBody Entry newEntry,
                                      Authentication authentication) {
        entryService.save(newEntry, authentication.getName());
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @ApiOperation(value = "User updates entry")
    @PutMapping(value = "/entry/{entryid}",
                consumes = {"application/json"})
    public ResponseEntity<?> updateEntry(@RequestBody Entry updateEntry,
                                         @PathVariable long entryid, Authentication authentication) {
        entryService.update(updateEntry, authentication.getName(), entryid);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @ApiOperation(value = "User deletes an entry",
                  response = void.class)
    @ApiResponses(value = {
            @ApiResponse(code = 200, message = "Entry Successfully Deleted", response = void.class),
            @ApiResponse(code = 404, message = "Entry Not Found", response = ErrorDetail.class)
    })
    @DeleteMapping("/entry/{entryid}")
    public ResponseEntity<?> deleteEntryById(@PathVariable long entryid, Authentication authentication) {
        entryService.delete(authentication.getName(), entryid);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
