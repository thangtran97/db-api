package com.example.dbapi.services.internal;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.example.dbapi.models.PersonalInfo;
import com.example.dbapi.models.User;
import com.example.dbapi.repositories.PersonalInfoRepository;
import com.example.dbapi.services.PersonalInfoService;

import com.example.dbapi.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PersonalInfoServiceImpl implements PersonalInfoService {

  @Autowired
  private PersonalInfoRepository personalInfoRepository;

  @Autowired
  private UserService userService;

  @Override
  public Map<String, Object> searchByConditions(String userId, String statement, Integer offset, Integer limit) {
    Map<String, Object> mapResponse = new LinkedHashMap<>();
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
    User user = userService.getUserByUserNo(userId);
    List<PersonalInfo> personalInfoList;

    if (user.getAuthorities().contains("SENSITIVE")) {
      personalInfoList = personalInfoRepository.getDetailSecret(inputCode);
    } else {
      personalInfoList = personalInfoRepository.getDetail(inputCode);
    }

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
