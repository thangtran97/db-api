package com.example.dbapi.models;

import java.util.Date;

import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@JsonNaming(PropertyNamingStrategy.SnakeCaseStrategy.class)
public class PersonalInfo {

  private String inputCode;

  private String motoCode;

  private String classCode;

  private String tourokumei;

  private String tourokumeiYomi;

  private String honmyou;

  private String honmyouYomi;

  private String hitsumei;

  private String hitsumeiYomi;

  private String seijiSetsumei;

  private String seibetsu;

  private String seinengappi;

  private String warekiSeinen;

  private String shusseiTodouhuken;

  private String shusseiShichou;

  private String shusshinTodouhuken;

  private String shusshinShichou;

  private String shibouNichiji;

  private String gakureki;

  private String genshoku;

  private String senkyoku;

  private String kaiha;

  private String seitou;

  private Integer tousenKaisuu;

  private String shozoku;

  private String motoshoku;

  private String keireki;

  private String senmonBunya;

  private String gyouseki;

  private String gakui;

  private String jushou;

  private String jitakuYuubinbangou;

  private String jitakuJuusho;

  private String jitakuMeishou;

  private String jitakuDenwa;

  private String jitakuFax;

  private String renrakusakiYuubinbangou;

  private String renrakusakiJuusho;

  private String renrakusakiMeishou;

  private String renrakusakiDenwa;

  private String renrakusakiDenwaShurui;

  private String renrakusakiDenwaNaisen;

  private String renrakusakiFax;

  private String renrakusakiFaxShurui;

  private String shoukenCode;

  private String keitaidenwa;

  private String email;

  private String homepage;

  private String souhusakiYuubinbangou;

  private String souhusakiJuusho;

  private String souhusakiMeishou;

  private String souhusakiDenwa;

  private String souhusakiDenwaShurui;

  private String souhusakiDenwaNaisen;

  private String souhusakiFax;

  private String souhusakiFaxShurui;

  private String shumi;

  private String kakusiKeisaiKiji;

  private String bikou;

  private String asahiJinbutsuJiten;

  private String henshuubuTyuu;

  private String koutekiShokumushaFlag;

  private String minkanChomeijinFlag;

  private String researchAtenaFlag;

  private String researchAtesakiFlag;

  private String dantaiStatus;

  private Date inputDate;

  private String inputAuthor;

  private String createMethod;

  private Date updateDate;

  private String updateHistory;

  private String publicationCondition;

  private String chiezouKouho;

  private String honmyouPub;

  private String hitsumeiPub;

  private String seijiSetsumeiPub;

  private String seibetsuPub;

  private String seinengappiPub;

  private String shusseiTodouhukenPub;

  private String shusseiShichouPub;

  private String shusshinTodouhukenPub;

  private String shusshinShichouPub;

  private String gakurekiPub;

  private String genshokuPub;

  private String shozokuPub;

  private String motoshokuPub;

  private String keirekiPub;

  private String senmonBunyaPub;

  private String gyousekiPub;

  private String gakuiPub;

  private String jushouPub;

  private String jitakuJuushoPub;

  private String jitakuDenwaPub;

  private String jitakuFaxPub;

  private String renrakusakiJuushoPub;

  private String renrakusakiDenwaPub;

  private String renrakusakiFaxPub;

  private String keitaidenwaPub;

  private String emailPub;

  private String homepagePub;

  private String souhusakiJuushoPub;

  private String souhusakiDenwaPub;

  private String souhusakiFaxPub;

  private String shumiPub;

  private String jinbutsuPub;

  private String freewordData;

  private String intaiFlag;

}
