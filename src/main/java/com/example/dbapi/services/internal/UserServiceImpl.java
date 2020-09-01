package com.example.dbapi.services.internal;

import com.example.dbapi.models.User;
import com.example.dbapi.services.UserService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

  private static final String BROWSE_SENSITIVE = "SENSITIVE";
  private static final String EDIT_RESPONSIVE = "RESPONSIVE";
  private static final String RED_LAN = "REDLAN";

  @Override
  public User getUserByUserNo(String userNo) {

    User users = new User();
    // local用スタブ
    switch (userNo) {
      // センシティブ:有り,編集権限:責任者,ネットワーク:青LAN
      case "1111":
        users.setUsername("朝日太郎１");
        users.setUserNo(userNo);
        users.setAuthorities(getAuthList(true, true, false));
        break;
      // センシティブ:有り,編集権限:スタッフ,ネットワーク:青LAN
      case "2222":
        users.setUsername("朝日太郎２");
        users.setUserNo(userNo);
        users.setAuthorities(getAuthList(true, false, false));
        break;
      // センシティブ:無し,編集権限:責任者,ネットワーク:青LAN
      case "3333":
        users.setUsername("朝日太郎３");
        users.setUserNo(userNo);
        users.setAuthorities(getAuthList(false, true, false));
        break;
      // センシティブ:無し,編集権限:スタッフ,ネットワーク:青LAN
      case "4444":
        users.setUsername("朝日太郎４");
        users.setUserNo(userNo);
        users.setAuthorities(getAuthList(false, false, false));
        break;
      // センシティブ:有り,編集権限:責任者,ネットワーク:赤LAN
      case "5555":
        users.setUsername("朝日太郎５");
        users.setUserNo(userNo);
        users.setAuthorities(getAuthList(true, true, true));
        break;
      // センシティブ:有り,編集権限:スタッフ,ネットワーク:赤LAN
      case "6666":
        users.setUsername("朝日太郎６");
        users.setUserNo(userNo);
        users.setAuthorities(getAuthList(true, false, true));
        break;
      default:
        break;
    }

    return users;

  }

  private List<String> getAuthList(boolean isBrowseSensitive, boolean isEditResponsive, boolean isRedLanNetwork) {
    List<String> authList = new ArrayList<>();
    if (isBrowseSensitive) {
      authList.add(BROWSE_SENSITIVE);
    }
    if (isEditResponsive) {
      authList.add(EDIT_RESPONSIVE);
    }
    if (isRedLanNetwork) {
      authList.add(RED_LAN);
    }
    return authList;
  }

}
