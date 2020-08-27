package com.example.dbapi.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.example.dbapi.models.PersonalInfo;

import org.springframework.jdbc.core.RowMapper;

public class PersonalInfoMapper implements RowMapper<PersonalInfo> {

    @Override
    public PersonalInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
        PersonalInfo personalInfo = new PersonalInfo();
        personalInfo.setInputCode(rs.getString("input_code"));
//        personalInfo.setMotoCode(rs.getString("moto_code"));
        personalInfo.setClassCode(rs.getString("class_code"));
        personalInfo.setTourokumei(rs.getString("tourokumei"));
        personalInfo.setTourokumeiYomi(rs.getString("tourokumei_yomi"));
        personalInfo.setHonmyou(rs.getString("honmyou"));
        personalInfo.setHonmyouYomi(rs.getString("honmyou_yomi"));
        personalInfo.setHitsumei(rs.getString("hitsumei"));
        personalInfo.setHitsumeiYomi(rs.getString("hitsumei_yomi"));
        personalInfo.setSeijiSetsumei(rs.getString("seiji_setsumei"));
        personalInfo.setSeibetsu(rs.getString("seibetsu"));
        personalInfo.setSeinengappi(rs.getString("seinengappi"));
        personalInfo.setWarekiSeinen(rs.getString("wareki_seinen"));
        personalInfo.setShusseiTodouhuken(rs.getString("shussei_todouhuken"));
        personalInfo.setShusseiShichou(rs.getString("shussei_shichou"));
        personalInfo.setShusshinTodouhuken(rs.getString("shusshin_todouhuken"));
        personalInfo.setShusshinShichou(rs.getString("shusshin_shichou"));
        personalInfo.setShibouNichiji(rs.getString("shibou_nichiji"));
        personalInfo.setGakureki(rs.getString("gakureki"));
        personalInfo.setGenshoku(rs.getString("genshoku"));
        personalInfo.setSenkyoku(rs.getString("senkyoku"));
        personalInfo.setKaiha(rs.getString("kaiha"));
        personalInfo.setSeitou(rs.getString("seitou"));
        personalInfo.setTousenKaisuu(rs.getInt("tousen_kaisuu"));
        personalInfo.setShozoku(rs.getString("shozoku"));
        personalInfo.setMotoshoku(rs.getString("motoshoku"));
        personalInfo.setKeireki(rs.getString("keireki"));
        personalInfo.setSenmonBunya(rs.getString("senmon_bunya"));
        personalInfo.setGyouseki(rs.getString("gyouseki"));
        personalInfo.setGakui(rs.getString("gakui"));
        personalInfo.setJushou(rs.getString("jushou"));
        personalInfo.setJitakuYuubinbangou(rs.getString("jitaku_yuubinbangou"));
        personalInfo.setJitakuJuusho(rs.getString("jitaku_juusho"));
        personalInfo.setJitakuMeishou(rs.getString("jitaku_meishou"));
        personalInfo.setJitakuDenwa(rs.getString("jitaku_denwa"));
        personalInfo.setJitakuFax(rs.getString("jitaku_fax"));
        personalInfo.setRenrakusakiYuubinbangou(rs.getString("renrakusaki_yuubinbangou"));
        personalInfo.setRenrakusakiJuusho(rs.getString("renrakusaki_juusho"));
        personalInfo.setRenrakusakiMeishou(rs.getString("renrakusaki_meishou"));
        personalInfo.setRenrakusakiDenwa(rs.getString("renrakusaki_denwa"));
        personalInfo.setRenrakusakiDenwaShurui(rs.getString("renrakusaki_denwa_shurui"));
        personalInfo.setRenrakusakiDenwaNaisen(rs.getString("renrakusaki_denwa_naisen"));
        personalInfo.setRenrakusakiFax(rs.getString("renrakusaki_fax"));
        personalInfo.setRenrakusakiFaxShurui(rs.getString("renrakusaki_fax_shurui"));
//        personalInfo.setShoukenCode(rs.getString("shouken_code"));
        personalInfo.setKeitaidenwa(rs.getString("keitaidenwa"));
        personalInfo.setEmail(rs.getString("email"));
        personalInfo.setHomepage(rs.getString("homepage"));
        personalInfo.setSouhusakiYuubinbangou(rs.getString("souhusaki_yuubinbangou"));
        personalInfo.setSouhusakiJuusho(rs.getString("souhusaki_juusho"));
        personalInfo.setSouhusakiMeishou(rs.getString("souhusaki_meishou"));
        personalInfo.setSouhusakiDenwa(rs.getString("souhusaki_denwa"));
        personalInfo.setSouhusakiDenwaShurui(rs.getString("souhusaki_denwa_shurui"));
        personalInfo.setSouhusakiDenwaNaisen(rs.getString("souhusaki_denwa_naisen"));
        personalInfo.setSouhusakiFax(rs.getString("souhusaki_fax"));
        personalInfo.setSouhusakiFaxShurui(rs.getString("souhusaki_fax_shurui"));
        personalInfo.setShumi(rs.getString("shumi"));
        personalInfo.setKakusiKeisaiKiji(rs.getString("kakusi_keisai_kiji"));
        personalInfo.setBikou(rs.getString("bikou"));
//        personalInfo.setAsahiJinbutsuJiten(rs.getString("asahi_jinbutsu_jiten"));
//        personalInfo.setHenshuubuTyuu(rs.getString("henshuubu_tyuu"));
        personalInfo.setKoutekiShokumushaFlag(rs.getString("kouteki_shokumusha_flag"));
        personalInfo.setMinkanChomeijinFlag(rs.getString("minkan_chomeijin_flag"));
//        personalInfo.setResearchAtenaFlag(rs.getString("research_atena_flag"));
//        personalInfo.setResearchAtesakiFlag(rs.getString("research_atesaki_flag"));
//        personalInfo.setDantaiStatus(rs.getString("dantai_status"));
//        personalInfo.setInputDate(rs.getDate("input_date"));
//        personalInfo.setInputAuthor(rs.getString("input_author"));
//        personalInfo.setCreateMethod(rs.getString("create_method"));
        personalInfo.setUpdateDate(rs.getDate("update_date"));
        personalInfo.setUpdateHistory(rs.getString("update_history"));
//        personalInfo.setPublicationCondition(rs.getString("publication_condition"));
//        personalInfo.setChiezouKouho(rs.getString("chiezou_kouho"));
        personalInfo.setHonmyouPub(rs.getString("honmyou_pub"));
        personalInfo.setHitsumeiPub(rs.getString("hitsumei_pub"));
        personalInfo.setSeijiSetsumeiPub(rs.getString("seiji_setsumei_pub"));
        personalInfo.setSeibetsuPub(rs.getString("seibetsu_pub"));
        personalInfo.setSeinengappiPub(rs.getString("seinengappi_pub"));
        personalInfo.setShusseiTodouhukenPub(rs.getString("shussei_todouhuken_pub"));
        personalInfo.setShusseiShichouPub(rs.getString("shussei_shichou_pub"));
        personalInfo.setShusshinTodouhukenPub(rs.getString("shusshin_todouhuken_pub"));
        personalInfo.setShusshinShichouPub(rs.getString("shusshin_shichou_pub"));
        personalInfo.setGakurekiPub(rs.getString("gakureki_pub"));
        personalInfo.setGenshokuPub(rs.getString("genshoku_pub"));
        personalInfo.setShozokuPub(rs.getString("shozoku_pub"));
        personalInfo.setMotoshokuPub(rs.getString("motoshoku_pub"));
        personalInfo.setKeirekiPub(rs.getString("keireki_pub"));
        personalInfo.setSenmonBunyaPub(rs.getString("senmon_bunya_pub"));
        personalInfo.setGyousekiPub(rs.getString("gyouseki_pub"));
        personalInfo.setGakuiPub(rs.getString("gakui_pub"));
        personalInfo.setJushouPub(rs.getString("jushou_pub"));
        personalInfo.setJitakuJuushoPub(rs.getString("jitaku_juusho_pub"));
        personalInfo.setJitakuDenwaPub(rs.getString("jitaku_denwa_pub"));
        personalInfo.setJitakuFaxPub(rs.getString("jitaku_fax_pub"));
        personalInfo.setRenrakusakiJuushoPub(rs.getString("renrakusaki_juusho_pub"));
        personalInfo.setRenrakusakiDenwaPub(rs.getString("renrakusaki_denwa_pub"));
        personalInfo.setRenrakusakiFaxPub(rs.getString("renrakusaki_fax_pub"));
        personalInfo.setKeitaidenwaPub(rs.getString("keitaidenwa_pub"));
        personalInfo.setEmailPub(rs.getString("email_pub"));
        personalInfo.setHomepagePub(rs.getString("homepage_pub"));
        personalInfo.setSouhusakiJuushoPub(rs.getString("souhusaki_juusho_pub"));
        personalInfo.setSouhusakiDenwaPub(rs.getString("souhusaki_denwa_pub"));
        personalInfo.setSouhusakiFaxPub(rs.getString("souhusaki_fax_pub"));
        personalInfo.setShumiPub(rs.getString("shumi_pub"));
        personalInfo.setJinbutsuPub(rs.getString("jinbutsu_pub"));
        personalInfo.setFreewordData(rs.getString("freeword_data"));
        personalInfo.setIntaiFlag(rs.getString("intai_flag"));
		return personalInfo;
    }

}