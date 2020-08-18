package com.example.dbapi.services;

import java.util.Map;

public interface PersonalInfoService {

    Map<String, Object> searchByConditions(String userId, String statement, Integer offset, Integer limit);

    Map<String, Object> getDetail(String userId, String inputCode);

}
