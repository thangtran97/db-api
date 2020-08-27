package com.example.dbapi.repositories;

import java.util.List;

import com.example.dbapi.models.PersonalInfo;

public interface PersonalInfoRepository {

  List<PersonalInfo> searchByConditions(String statement, Integer offset, Integer limit);

  Integer countByConditions(String statement);

  List<PersonalInfo> getDetail(String inputCode);

  List<PersonalInfo> getDetailSecret(String inputCode);

}
