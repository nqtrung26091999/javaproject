package com.ex.spring.util;

import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Component
public class MessageUtils {
    public Map<String, String> getMessage(String message) {
        Map<String, String> result = new HashMap<>();
        switch (message) {
            case "insert_category":
            case "insert_news":
                result.put("message", "Insert success !");
                result.put("alert", "success");
                break;
            case "update_category":
            case "update_news":
                result.put("message", "Update success !");
                result.put("alert", "success");
                break;
            case "error_system":
                result.put("message", "Error system !");
                result.put("alert", "danger");
                break;
            case "delete_category":
            case "delete_news":
                result.put("message", "Delete success !");
                result.put("alert", "success");
                break;
        }
        return result;
    }
}
