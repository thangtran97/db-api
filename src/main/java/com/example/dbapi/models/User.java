package com.example.dbapi.models;

import lombok.Data;

import java.util.List;

@Data
public class User {

  private String username;

  private String password;

  private String userNo;

  private List<String> authorities;

}
