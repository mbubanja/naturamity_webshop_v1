package com.naturamity.exceptions;

public class InvalidUsernamePasswordException extends Exception{

    public InvalidUsernamePasswordException(){
        super("Invalid username or/and password!");
    }
}
