package com.example.dbapi.services.internal;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.example.dbapi.models.PersonalInfo;
import com.example.dbapi.repositories.PersonalInfoRepository;
import com.example.dbapi.services.PersonalInfoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PersonalInfoServiceImpl implements PersonalInfoService {

  @Autowired
  PersonalInfoRepository personalInfoRepository;

  @Override
  public Map<String, Object> searchByConditions(String userId, String statement, Integer offset, Integer limit) {
    Map<String, Object> mapResponse = new LinkedHashMap<>();
    if (statement.isEmpty()) {
      mapResponse.put("sqlstate", "26000");
      mapResponse.put("count", 0);
      mapResponse.put("message", "invalid_sql_statement_name");
      return mapResponse;
    }

    Integer totalResult = personalInfoRepository.countByConditions(statement).size();
    if (totalResult == 0) {
      mapResponse.put("sqlstate", "02000");
      mapResponse.put("count", totalResult);
      mapResponse.put("message", "no_data");
      return mapResponse;
    }

    List<PersonalInfo> personalInfoList = personalInfoRepository.searchByConditions(statement, offset, limit);
    mapResponse.put("sqlstate", "00000");
    mapResponse.put("count", totalResult);
    mapResponse.put("results", personalInfoList);
    return mapResponse;
  }

  @Override
  public Map<String, Object> getDetail(String userId, String inputCode) {
    Map<String, Object> mapResponse = new LinkedHashMap<>();
    if (inputCode.isEmpty()) {
      mapResponse.put("sqlstate", "26000");
      mapResponse.put("count", 0);
      mapResponse.put("message", "invalid_sql_statement_name");
      return mapResponse;
    }

    List<PersonalInfo> personalInfoList = personalInfoRepository.getDetailSecret(inputCode);
    if (personalInfoList.isEmpty()) {
      mapResponse.put("sqlstate", "02000");
      mapResponse.put("count", personalInfoList.size());
      mapResponse.put("message", "no_data");
      return mapResponse;
    }
    mapResponse.put("sqlstate", "00000");
    mapResponse.put("count", personalInfoList.size());
    mapResponse.put("results", personalInfoList);
    return mapResponse;
  }

}
