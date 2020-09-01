package com.example.dbapi.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.dbapi.models.PersonalInfo;
import com.example.dbapi.repositories.PersonalInfoRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PersonalInfoDAO implements PersonalInfoRepository {

  @Autowired
  NamedParameterJdbcTemplate jdbcTemplate;

  @Override
  public List<PersonalInfo> searchPersonalSecretByConditions(String statement, Integer offset, Integer limit) {
    String sql = statement + " LIMIT :limit OFFSET :offset";
    Map param = new HashMap<String, Object>();
    param.put("limit", limit);
    param.put("offset", offset);
    return jdbcTemplate.query(sql, param, new PersonalSecretMapper());
  }

  @Override
  public List<PersonalInfo> searchPersonalInfoByConditions(String statement, Integer offset, Integer limit) {
    String sql = statement + " LIMIT :limit OFFSET :offset";
    Map param = new HashMap<String, Object>();
    param.put("limit", limit);
    param.put("offset", offset);
    return jdbcTemplate.query(sql, param, new PersonalInfoMapper());
  }

  @Override
  public List<PersonalInfo> countByConditions(String statement) {
    String sql = statement;
    Map param = new HashMap<String, Object>();
    return jdbcTemplate.query(sql, param, new PersonalInfoMapper());
  }

  @Override
  public List<PersonalInfo> countSecretByConditions(String statement) {
    String sql = statement;
    Map param = new HashMap<String, Object>();
    return jdbcTemplate.query(sql, param, new PersonalSecretMapper());
  }

  @Override
  public List<PersonalInfo> getDetailPersonalInfo(String inputCode) {
    String sql = "SELECT * FROM public_personal_info WHERE input_code = :input_code LIMIT 1";
    Map param = new HashMap<String, Object>();
    param.put("input_code", inputCode);
    return jdbcTemplate.query(sql, param, new PersonalInfoMapper());
  }

  @Override
  public List<PersonalInfo> getDetailPersonalSecret(String inputCode) {
    String sql = "SELECT * FROM public_personal_secret WHERE input_code = :input_code";
    Map param = new HashMap<String, Object>();
    param.put("input_code", inputCode);
    return jdbcTemplate.query(sql, param, new PersonalSecretMapper());
  }

}
