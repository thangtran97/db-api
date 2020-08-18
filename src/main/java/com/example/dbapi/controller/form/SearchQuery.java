package com.example.dbapi.controller.form;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter
public class SearchQuery {

  private String userId;

  private String inputCode;

  private String statement;

  private Integer offset;

  private Integer limit;

}
