package com.example.dbapi.controller;

import java.util.Map;

import com.example.dbapi.controller.form.SearchQuery;
import com.example.dbapi.services.PersonalInfoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PersonalInfoController {

  @Autowired
  PersonalInfoService personalInfoService;

  @PostMapping("/select")
  public ResponseEntity search(@RequestBody SearchQuery searchQuery) {
    Map<String, Object> mapResponse = personalInfoService.searchByConditions(searchQuery.getUserId(), searchQuery.getStatement(), searchQuery.getOffset(), searchQuery.getLimit());
    return new ResponseEntity(mapResponse, HttpStatus.OK);
  }

  @PostMapping("/get")
  public ResponseEntity get(@RequestBody SearchQuery searchQuery) {
    Map<String, Object> mapResponse = personalInfoService.getDetail(searchQuery.getUserId(), searchQuery.getInputCode());
    return new ResponseEntity(mapResponse, HttpStatus.OK);
  }

}
