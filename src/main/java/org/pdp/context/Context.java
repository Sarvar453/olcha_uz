package org.pdp.context;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.pdp.entity.User;


public class Context {
    private static User currentUser;
    public static User getCurrentUser(){
        return currentUser;
    }
    public static void setCurrentUser(User newUser){
        currentUser=newUser;
    }
}
