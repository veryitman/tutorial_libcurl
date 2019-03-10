package com.veryitman.springboot.model;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class UserModel {
    Integer userID;
    String userName;
    Integer userAge;
    Integer userGender;
}
