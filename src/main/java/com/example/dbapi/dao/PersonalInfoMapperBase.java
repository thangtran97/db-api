package com.example.dbapi.dao;

import com.example.dbapi.models.PersonalInfo;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class PersonalInfoMapperBase implements RowMapper<PersonalInfo> {

  @Override
  public PersonalInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
    PersonalInfo personalInfo = new PersonalInfo();
    personalInfo.setInputCode(rs.getString("input_code"));
//        personalInfo.setMotoCode(rs.getString("moto_code"));
//    personalInfo.setClassCode(rs.getString("class_code"));
    personalInfo.setTourokumei(rs.getString("tourokumei"));
    personalInfo.setTourokumeiYomi(rs.getString("tourokumei_yomi"));
    personalInfo.setGenshoku(rs.getString("genshoku"));
    personalInfo.setShozoku(rs.getString("shozoku"));
    personalInfo.setMotoshoku(rs.getString("motoshoku"));
    personalInfo.setUpdateDate(rs.getDate("update_date"));
    return personalInfo;
  }

}
