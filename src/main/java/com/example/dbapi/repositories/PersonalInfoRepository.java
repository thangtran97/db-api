package com.example.dbapi.repositories;

import java.util.List;

import com.example.dbapi.models.PersonalInfo;
import com.example.dbapi.models.PersonalSecret;

public interface PersonalInfoRepository {

  List<PersonalInfo> searchPersonalInfoByConditions(String statement, Integer offset, Integer limit);

  List<PersonalInfo> searchPersonalSecretByConditions(String statement, Integer offset, Integer limit);

  List<PersonalInfo> countByConditions(String statement);

  List<PersonalInfo> countSecretByConditions(String statement);

  List<PersonalInfo> getDetailPersonalInfo(String inputCode);

  List<PersonalSecret> getDetailPersonalSecret(String inputCode);

}
